// GitHubRepositoriesScreen

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Provider/GitHubRepositoriesProvider.dart';
import 'GitHubRepositoryDetailScreen.dart';

final class GitHubRepositoriesScreen extends ConsumerWidget {
  const GitHubRepositoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gitHubRepositoriesProvider);
    return Stack(
      children: [
        Scaffold(
        appBar: AppBar(
          surfaceTintColor: Theme.of(context).colorScheme.background,
            title: SizedBox(
                height: 50,
                child: SearchBar(
                    leading: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Icon(Icons.search),
                    ),
                    hintText: 'Search',
                    shadowColor: const MaterialStatePropertyAll(Color.fromARGB(0, 0, 0, 0),),
                    onChanged: (value) {
                      ref.read(gitHubRepositoriesProvider.notifier).search(value);
                    },
                  ),
              ),
        ),
        body: Column(
          children: [
            if (state.isLoading) const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: CircularProgressIndicator(),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: state.repositories.length,
                itemBuilder: (context, index) {
                  final repository = state.repositories[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(repository.name, style: const TextStyle(fontSize: 18)),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return GitHubRepositoryDetailScreen(repository: repository);
                              },
                            ),
                          );
                        },
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      ]
    );
  }

  // dedounce search
  // void search(String value) {
  //   Future.delayed(const Duration(milliseconds: 500), () {
  //     ref.read(gitHubRepositoriesProvider.notifier).search(value);
  //   });
  // }
}
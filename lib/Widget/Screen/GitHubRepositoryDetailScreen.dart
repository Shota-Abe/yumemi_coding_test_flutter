// GitHubRepositoryDetailScreen

import 'package:flutter/material.dart';

import '../../API/GitHubRepository.dart';

class GitHubRepositoryDetailScreen extends StatelessWidget {
  const GitHubRepositoryDetailScreen({
    required this.repository,
    Key? key,
  }) : super(key: key);

  final GitHubRepository repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(repository.ownerAvatarUrl),
                  radius: 20,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(width: 10),
                Text(
                  repository.name, 
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                const Text(
                  'Language: ',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  repository.language,
                  style: const TextStyle(fontSize: 16),
                ),
                const Spacer(),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                card(
                  icon: const Icon(Icons.star, size: 20, color: Colors.orange),
                  label: 'Stars: ',
                  value: repository.stargazersCount.toString(),
                ),
                const SizedBox(width: 4),
                card(
                  icon: const Icon(Icons.remove_red_eye, size: 20, color: Colors.blueGrey),
                  label: 'Watchers: ',
                  value: repository.watchersCount.toString(),
                ),
              ],
            ),

            const SizedBox(height: 4,),

            Row(
              children: [
                card(
                  icon: const Icon(Icons.call_split, size: 20, color: Colors.lightGreen),
                  label: 'Forks: ',
                  value: repository.forksCount.toString(),
                ),
                const SizedBox(width: 4),
                card(
                  icon: const Icon(Icons.error, size: 20, color: Colors.redAccent),
                  label: 'Open Issues: ',
                  value: repository.openIssuesCount.toString(),
                ),
              ],
            ),

            const SizedBox(height: 40),

            Text(repository.description, style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 20),

            Text(repository.url, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget card({
    required Icon icon,
    required String label,
    required String value
  }) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: Row(
              children: [
                icon,
                const SizedBox(width: 5),
                Text(label),
                const SizedBox(width: 10,),
                Text(value)
              ],
            ),
        ),
      );
  }
}
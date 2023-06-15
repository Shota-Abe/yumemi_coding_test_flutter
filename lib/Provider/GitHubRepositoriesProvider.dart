// GitHubRepositoriesProvider

import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../API/GitHubRepository.dart';
import '../Entity/GitHubClient.dart';

final class GitHubRepositoriesState {
  final List<GitHubRepository> repositories;
  final String query;
  bool isLoading = false;

  GitHubRepositoriesState({
    required this.repositories,
    required this.query,
    required this.isLoading,
  });
  
  GitHubRepositoriesState copyWith({
    List<GitHubRepository>? repositories,
    String? query,
    bool? isLoading,
  }) {
    return GitHubRepositoriesState(
      repositories: repositories ?? this.repositories,
      query: query ?? this.query,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

final class GitHubRepositoriesProvider extends StateNotifier<GitHubRepositoriesState> {
  GitHubRepositoriesProvider() : super(GitHubRepositoriesState(repositories: [], query: '', isLoading: false));
  final client = GitHubClient(httpClient: http.Client());
  final debounceDuration = const Duration(milliseconds: 1000);
  Timer? _debounceTimer;

  void search(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(debounceDuration, () async {
      state = state.copyWith(query: query, isLoading: true);
      final repositories = await client.searchRepositories(query);
      state = state.copyWith(repositories: repositories, isLoading: false);
    });
  }
}

final gitHubRepositoriesProvider = StateNotifierProvider<GitHubRepositoriesProvider, GitHubRepositoriesState>((ref) => GitHubRepositoriesProvider());
// GitHubRepositoryDetailScreen

import 'package:flutter/material.dart';

import '../../Model/GitHubRepository.dart';

class GitHubRepositoryDetailScreen extends StatelessWidget {
  const GitHubRepositoryDetailScreen(
      {required this.repository, super.key});

  final GitHubRepository repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(repository.name),
      ),
      body: Center(
        child: Text(repository.description),
      ),
    );
  }
}
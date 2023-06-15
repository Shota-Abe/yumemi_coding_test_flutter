// GitHubClientTest

import 'package:flutter/material.dart';
import 'package:test/test.dart';

import '../lib/Model/GitHubClient.dart';
import '../lib/Model/GitHubRepository.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() {
  test('GitHubClient.searchRepositories', () async {
    final client = GitHubClient(httpClient: http.Client());
    final repositories = await client.searchRepositories('flutter');
    expect(repositories.length, greaterThan(0));
    for (var repository in repositories) {
      debugPrint(repository.name);
    }
  });
}

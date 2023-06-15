// GitHubClient.dart

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../Model/GitHubRepository.dart';

class GitHubClient {
  final String baseUrl = 'api.github.com';
  final http.Client httpClient;

  GitHubClient({required this.httpClient});

  Future<List<GitHubRepository>> searchRepositories(String query) async {
    List<GitHubRepository> repositories = [];

    int pageNumber = 1;
    int maxPageNumber = 10; // 10ページで上限とする
    int perPage = 100; // 1ページあたりの上限は100

    while (pageNumber <= maxPageNumber) {
      final Uri url = Uri.https(
        baseUrl,
        '/search/repositories',
        {'q': '$query', 'per_page': '$perPage', 'page': '$pageNumber'},
      );

      final response = await httpClient.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(response.body);
        final items = jsonResponse['items'];

        if (items != null) {
          repositories.addAll(
            List.from(items)
                .map((json) => GitHubRepository.fromJson(json))
                .toList(),
          );
          if (items.length < perPage) {
            // リポジトリがperPage以下の場合はもう取得できるリポジトリはないためループを抜ける
            break;
          }
        } else {
          // itemsがnullの場合はリポジトリは存在しないためループを抜ける
          break;
        }
      } else {
        // リクエストが失敗した場合はループを抜ける
        print('Request failed with status: ${response.statusCode}.');
        break;
      }

      pageNumber++;
    }

    return repositories;
  }
}
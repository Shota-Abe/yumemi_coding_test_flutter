
final class GitHubRepository {
  final int id;
  final String name;
  final String ownerAvatarUrl;
  final String description;
  final String url;
  final String language;
  final int stargazersCount;
  final int watchersCount;
  final int forksCount;
  final int openIssuesCount;

  GitHubRepository(
      {required this.id,
      required this.name,
      required this.ownerAvatarUrl,
      required this.description,
      required this.url,
      required this.language,
      required this.stargazersCount,
      required this.watchersCount,
      required this.forksCount,
      required this.openIssuesCount,
      });

  factory GitHubRepository.fromJson(Map<String, dynamic> json) {
    return GitHubRepository(
        id: json['id'],
        name: json['name'],
        ownerAvatarUrl: json['owner']['avatar_url'],
        description: json['description'] ?? '',
        url: json['html_url'],
        language: json['language'] ?? '',
        stargazersCount: json['stargazers_count'],
        watchersCount: json['watchers_count'],
        forksCount: json['forks_count'],
        openIssuesCount: json['open_issues_count'],);
  }
}
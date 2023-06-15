
final class GitHubRepository {
  final int id;
  final String name;
  final String description;
  final String url;

  GitHubRepository(
      {required this.id,
      required this.name,
      required this.description,
      required this.url});

  factory GitHubRepository.fromJson(Map<String, dynamic> json) {
    return GitHubRepository(
        id: json['id'],
        name: json['name'],
        description: json['description'] ?? '',
        url: json['html_url']);
  }
}
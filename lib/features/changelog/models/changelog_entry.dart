class ChangelogEntry {
  final String id;
  final String version;
  final String title;
  final String description;
  final List<String> changes;
  final DateTime releaseDate;

  ChangelogEntry({
    required this.id,
    required this.version,
    required this.title,
    required this.description,
    required this.changes,
    required this.releaseDate,
  });
}


class FeedbackItem {
  final String id;
  final String title;
  final String message;
  final String authorEmail;
  final DateTime createdAt;

  FeedbackItem({
    required this.id,
    required this.title,
    required this.message,
    required this.authorEmail,
    required this.createdAt,
  });
}


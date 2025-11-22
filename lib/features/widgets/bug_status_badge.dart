import 'package:flutter/material.dart';
import '../../features/bug_reports/models/bug_report.dart';

class BugStatusBadge extends StatelessWidget {
  final BugStatus status;
  final EdgeInsetsGeometry? padding;

  const BugStatusBadge({
    super.key,
    required this.status,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;
    
    switch (status) {
      case BugStatus.open:
        color = Colors.blue;
        text = 'Открыт';
        break;
      case BugStatus.inProgress:
        color = Colors.purple;
        text = 'В работе';
        break;
      case BugStatus.resolved:
        color = Colors.green;
        text = 'Решен';
        break;
      case BugStatus.closed:
        color = Colors.black;
        text = 'Закрыт';
        break;
    }
    
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}


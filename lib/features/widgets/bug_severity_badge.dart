import 'package:flutter/material.dart';
import '../../features/bug_reports/models/bug_report.dart';

class BugSeverityBadge extends StatelessWidget {
  final BugSeverity severity;
  final EdgeInsetsGeometry? padding;

  const BugSeverityBadge({
    super.key,
    required this.severity,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;
    
    switch (severity) {
      case BugSeverity.low:
        color = Colors.green;
        text = 'Низкий';
        break;
      case BugSeverity.medium:
        color = Colors.orange;
        text = 'Средний';
        break;
      case BugSeverity.high:
        color = Colors.deepOrange;
        text = 'Высокий';
        break;
      case BugSeverity.critical:
        color = Colors.red;
        text = 'Критический';
        break;
    }
    
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color),
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


import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import '../../widgets/bug_severity_badge.dart';
import '../stores/bug_report_detail_store.dart';
import '../models/bug_report.dart';
import '../../widgets/bug_status_badge.dart';
import '../../widgets/info_row.dart';

class BugReportDetailScreen extends StatelessWidget {
  final String bugReportId;

  const BugReportDetailScreen({
    super.key,
    required this.bugReportId,
  });

  @override
  Widget build(BuildContext context) {
    final store = BugReportDetailStore(bugReportId, GetIt.I<ObservableList<BugReport>>());
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Детали баг-репорта'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.push('/bug-reports/${store.bugReport?.id}/edit'),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          final bug = store.bugReport;
          
          if (bug == null) {
            return const Center(
              child: Text('Баг-репорт не найден'),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bug.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    BugSeverityBadge(severity: bug.severity),
                    const SizedBox(width: 8),
                    BugStatusBadge(status: bug.status),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Шаги воспроизведения:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  bug.stepsToReproduce,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Фактический результат:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  bug.actualResult,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Ожидаемый результат:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  bug.expectedResult,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                InfoRow(label: 'Продукт:', value: bug.productName),
                const SizedBox(height: 12),
                InfoRow(label: 'Сообщил:', value: bug.reportedBy),
                const SizedBox(height: 12),
                InfoRow(
                  label: 'Создан:',
                  value: DateFormat('dd.MM.yyyy HH:mm').format(bug.createdAt),
                ),
                if (bug.updatedAt != null) ...[
                  const SizedBox(height: 12),
                  InfoRow(
                    label: 'Обновлен:',
                    value: DateFormat('dd.MM.yyyy HH:mm').format(bug.updatedAt!),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}


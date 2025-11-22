import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
import '../stores/bug_reports_list_store.dart';
import '../models/bug_report.dart';
import '../../products/models/product.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/bug_severity_badge.dart';
import '../../widgets/bug_status_badge.dart';

class BugReportsScreen extends StatelessWidget {
  const BugReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = BugReportsListStore(GetIt.I<ObservableList<BugReport>>());
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Баг-репорты'),
      ),
      drawer: const AppDrawer(currentRoute: '/bug-reports'),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/bug-reports/create'),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Observer(
                  builder: (_) => TextField(
                    decoration: InputDecoration(
                      hintText: 'Поиск...',
                      prefixIcon: const Icon(Icons.search),
                      border: const OutlineInputBorder(),
                      suffixIcon: store.searchQuery.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () => store.setSearchQuery(''),
                            )
                          : null,
                    ),
                    onChanged: store.setSearchQuery,
                  ),
                ),
                const SizedBox(height: 12),
                Observer(
                  builder: (_) {
                    final productsList = GetIt.I<ObservableList<Product>>();
                    return Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: DropdownButtonFormField<String?>(
                            decoration: const InputDecoration(
                              labelText: 'Продукт',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            ),
                            value: store.productFilter,
                            items: [
                              const DropdownMenuItem(
                                value: null,
                                child: Text('Все продукты'),
                              ),
                              ...productsList.map((product) => DropdownMenuItem(
                                value: product.id,
                                child: Text(product.name),
                              )),
                            ],
                            onChanged: (value) => store.setProductFilter(value),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: DropdownButtonFormField<BugSeverity?>(
                            decoration: const InputDecoration(
                              labelText: 'Приоритет',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            ),
                            value: store.severityFilter,
                            items: const [
                              DropdownMenuItem(
                                value: null,
                                child: Text('Все'),
                              ),
                              DropdownMenuItem(
                                value: BugSeverity.low,
                                child: Text('Низкий'),
                              ),
                              DropdownMenuItem(
                                value: BugSeverity.medium,
                                child: Text('Средний'),
                              ),
                              DropdownMenuItem(
                                value: BugSeverity.high,
                                child: Text('Высокий'),
                              ),
                              DropdownMenuItem(
                                value: BugSeverity.critical,
                                child: Text('Критический'),
                              ),
                            ],
                            onChanged: (value) => store.setSeverityFilter(value),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: DropdownButtonFormField<BugStatus?>(
                            decoration: const InputDecoration(
                              labelText: 'Статус',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            ),
                            value: store.statusFilter,
                            items: const [
                              DropdownMenuItem(
                                value: null,
                                child: Text('Все'),
                              ),
                              DropdownMenuItem(
                                value: BugStatus.open,
                                child: Text('Открыт'),
                              ),
                              DropdownMenuItem(
                                value: BugStatus.inProgress,
                                child: Text('В работе'),
                              ),
                              DropdownMenuItem(
                                value: BugStatus.resolved,
                                child: Text('Решен'),
                              ),
                              DropdownMenuItem(
                                value: BugStatus.closed,
                                child: Text('Закрыт'),
                              ),
                            ],
                            onChanged: (value) => store.setStatusFilter(value),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                final bugs = store.filteredBugReports;
                if (bugs.isEmpty) {
                  return const Center(
                    child: Text('Нет баг-репортов'),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: bugs.length,
                  itemBuilder: (context, index) {
                    final bug = bugs[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: InkWell(
                        onTap: () => context.push('/bug-reports/${bug.id}'),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    BugSeverityBadge(
                                      severity: bug.severity,
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    ),
                                    const SizedBox(width: 8),
                                    BugStatusBadge(
                                      status: bug.status,
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    ),
                                  ],
                                ),
                              const SizedBox(height: 8),
                              Text(
                                bug.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                bug.stepsToReproduce,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.black),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.apps, size: 16, color: Colors.black),
                                  const SizedBox(width: 4),
                                  Text(
                                    bug.productName,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  const Spacer(),
                                  Text(
                                    DateFormat('dd.MM.yyyy').format(bug.createdAt),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import '../stores/edit_bug_report_store.dart';
import '../models/bug_report.dart';
import '../../products/stores/products_list_store.dart';
import '../../products/models/product.dart';

class EditBugReportScreen extends StatelessWidget {
  final String bugReportId;

  const EditBugReportScreen({
    super.key,
    required this.bugReportId,
  });

  @override
  Widget build(BuildContext context) {
    final bugReportsList = GetIt.I<ObservableList<BugReport>>();
    final bugReport = bugReportsList.firstWhere((b) => b.id == bugReportId);
    final store = EditBugReportStore(bugReportsList, bugReport);
    final productsStore = ProductsListStore(GetIt.I<ObservableList<Product>>());
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Редактировать баг-репорт'),
      ),
      body: Observer(
        builder: (_) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Заголовок',
                  border: OutlineInputBorder(),
                ),
                controller: TextEditingController(text: store.title)
                  ..selection = TextSelection.fromPosition(
                    TextPosition(offset: store.title.length),
                  ),
                onChanged: store.setTitle,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Шаги воспроизведения',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: 4,
                controller: TextEditingController(text: store.stepsToReproduce)
                  ..selection = TextSelection.fromPosition(
                    TextPosition(offset: store.stepsToReproduce.length),
                  ),
                onChanged: store.setStepsToReproduce,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Фактический результат',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: 3,
                controller: TextEditingController(text: store.actualResult)
                  ..selection = TextSelection.fromPosition(
                    TextPosition(offset: store.actualResult.length),
                  ),
                onChanged: store.setActualResult,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Ожидаемый результат',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: 3,
                controller: TextEditingController(text: store.expectedResult)
                  ..selection = TextSelection.fromPosition(
                    TextPosition(offset: store.expectedResult.length),
                  ),
                onChanged: store.setExpectedResult,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Продукт',
                  border: OutlineInputBorder(),
                ),
                value: store.selectedProductId,
                items: productsStore.allProducts
                    .map((product) => DropdownMenuItem(
                          value: product.id,
                          child: Text(product.name),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    final product = productsStore.allProducts
                        .firstWhere((p) => p.id == value);
                    store.setProduct(value, product.name);
                  }
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<BugSeverity>(
                decoration: const InputDecoration(
                  labelText: 'Приоритет',
                  border: OutlineInputBorder(),
                ),
                value: store.severity,
                items: const [
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
                onChanged: (value) => store.setSeverity(value!),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<BugStatus>(
                decoration: const InputDecoration(
                  labelText: 'Статус',
                  border: OutlineInputBorder(),
                ),
                value: store.status,
                items: const [
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
                onChanged: (value) => store.setStatus(value!),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: store.isSubmitting
                    ? null
                    : () {
                        final success = store.updateBugReport();
                        if (!success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Заполните все поля'),
                            ),
                          );
                          return;
                        }
                        context.go('/bug-reports');
                      },
                child: store.isSubmitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Сохранить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


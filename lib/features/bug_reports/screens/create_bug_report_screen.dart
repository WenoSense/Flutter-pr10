import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import '../stores/create_bug_report_store.dart';
import '../models/bug_report.dart';
import '../../products/stores/products_list_store.dart';
import '../../products/models/product.dart';
import '../../auth/stores/login_store.dart';

class CreateBugReportScreen extends StatelessWidget {
  const CreateBugReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = CreateBugReportStore(
      GetIt.I<LoginStore>(),
      GetIt.I<ObservableList<BugReport>>(),
    );
    final productsStore = ProductsListStore(GetIt.I<ObservableList<Product>>());
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Новый баг-репорт'),
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
                onChanged: store.setExpectedResult,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Продукт',
                  border: OutlineInputBorder(),
                ),
                initialValue: store.selectedProductId,
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
                initialValue: store.severity,
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
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: store.isSubmitting
                    ? null
                    : () {
                        final success = store.createBugReport();
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
                    : const Text('Создать'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


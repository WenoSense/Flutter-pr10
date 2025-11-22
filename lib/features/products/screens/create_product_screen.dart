import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import '../stores/create_product_store.dart';
import '../models/product.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = CreateProductStore(GetIt.I<ObservableList<Product>>());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Новый программный продукт'),
      ),
      body: Observer(
        builder: (_) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Название',
                  border: OutlineInputBorder(),
                ),
                onChanged: store.setName,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Описание',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: 3,
                onChanged: store.setDescription,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Версия',
                  border: OutlineInputBorder(),
                  hintText: '1.0.0',
                ),
                onChanged: store.setVersion,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Платформа',
                  border: OutlineInputBorder(),
                ),
                initialValue: store.platform,
                items: const [
                  DropdownMenuItem(
                    value: 'Mobile',
                    child: Text('Mobile'),
                  ),
                  DropdownMenuItem(
                    value: 'Web',
                    child: Text('Web'),
                  ),
                  DropdownMenuItem(
                    value: 'Desktop',
                    child: Text('Desktop'),
                  ),
                ],
                onChanged: (value) => store.setPlatform(value!),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Разработчик',
                  border: OutlineInputBorder(),
                ),
                onChanged: store.setDeveloper,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Ссылка на продукт',
                  border: OutlineInputBorder(),
                  hintText: 'https://example.com',
                ),
                keyboardType: TextInputType.url,
                onChanged: store.setLink,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: store.isSubmitting
                    ? null
                    : () {
                        final success = store.createProduct();
                        if (!success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Заполните все поля'),
                            ),
                          );
                          return;
                        }
                        context.go('/products');
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


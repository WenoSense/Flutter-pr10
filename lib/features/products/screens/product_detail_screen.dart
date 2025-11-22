import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import '../stores/product_detail_store.dart';
import '../models/product.dart';
import '../../widgets/info_row.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;

  const ProductDetailScreen({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    final store = ProductDetailStore(productId, GetIt.I<ObservableList<Product>>());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Детали программного продукта'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.push('/products/${store.product?.id}/edit'),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          final product = store.product;
          
          if (product == null) {
            return const Center(
              child: Text('Продукт не найден'),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'v${product.version}',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Описание:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                InfoRow(label: 'Платформа:', value: product.platform, labelWidth: 120),
                const SizedBox(height: 12),
                InfoRow(label: 'Разработчик:', value: product.developer, labelWidth: 120),
                const SizedBox(height: 12),
                InfoRow(label: 'Ссылка:', value: product.link ?? '', labelWidth: 120),
                const SizedBox(height: 12),
                InfoRow(
                  label: 'Создан:',
                  value: DateFormat('dd.MM.yyyy').format(product.createdAt),
                  labelWidth: 120,
                ),
                if (product.updatedAt != null) ...[
                  const SizedBox(height: 12),
                  InfoRow(
                    label: 'Обновлен:',
                    value: DateFormat('dd.MM.yyyy').format(product.updatedAt!),
                    labelWidth: 120,
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


import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import '../stores/products_list_store.dart';
import '../models/product.dart';
import '../../widgets/app_drawer.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = ProductsListStore(GetIt.I<ObservableList<Product>>());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Программные продукты'),
      ),
      drawer: const AppDrawer(currentRoute: '/products'),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/products/create'),
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
                  builder: (_) => DropdownButtonFormField<String?>(
                    decoration: const InputDecoration(
                      labelText: 'Платформа',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    value: store.platformFilter,
                    items: const [
                      DropdownMenuItem(
                        value: null,
                        child: Text('Все платформы'),
                      ),
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
                    onChanged: (value) => store.setPlatformFilter(value),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                final products = store.filteredProducts;
                if (products.isEmpty) {
                  return const Center(
                    child: Text('Нет продуктов'),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: InkWell(
                        onTap: () => context.push('/products/${product.id}'),
                        child: Padding(
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
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      product.version,
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                            Text(
                              product.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.black),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  _getPlatformIcon(product.platform),
                                  size: 16,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  product.platform,
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

  IconData _getPlatformIcon(String platform) {
    switch (platform) {
      case 'Mobile':
        return Icons.phone_android;
      case 'Web':
        return Icons.web;
      case 'Desktop':
        return Icons.computer;
      default:
        return Icons.devices;
    }
  }

}


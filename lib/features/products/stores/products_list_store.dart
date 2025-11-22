import 'package:mobx/mobx.dart';
import '../models/product.dart';

part 'products_list_store.g.dart';

class ProductsListStore = _ProductsListStore with _$ProductsListStore;

abstract class _ProductsListStore with Store {
  final ObservableList<Product> allProducts;

  _ProductsListStore(this.allProducts);

  @observable
  String searchQuery = '';

  @observable
  String? platformFilter;

  @computed
  List<Product> get filteredProducts {
    var products = allProducts.toList();

    if (searchQuery.isNotEmpty) {
      products = products.where((product) {
        return product.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
            product.description.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }

    if (platformFilter != null && platformFilter!.isNotEmpty) {
      products = products.where((product) => product.platform == platformFilter).toList();
    }

    return products;
  }

  @action
  void setSearchQuery(String value) => searchQuery = value;

  @action
  void setPlatformFilter(String? value) => platformFilter = value;

  @action
  void clearFilters() {
    searchQuery = '';
    platformFilter = null;
  }

  @action
  void updateProduct(Product updatedProduct) {
    final index = allProducts.indexWhere((p) => p.id == updatedProduct.id);
    if (index != -1) {
      allProducts[index] = updatedProduct;
    }
  }
}


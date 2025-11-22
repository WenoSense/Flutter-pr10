import 'package:mobx/mobx.dart';
import '../models/product.dart';

part 'product_detail_store.g.dart';

class ProductDetailStore = _ProductDetailStore with _$ProductDetailStore;

abstract class _ProductDetailStore with Store {
  final String productId;
  final ObservableList<Product> productsList;

  _ProductDetailStore(this.productId, this.productsList);

  @computed
  Product? get product {
    try {
      return productsList.firstWhere((p) => p.id == productId);
    } catch (e) {
      return null;
    }
  }
}


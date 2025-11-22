import 'package:mobx/mobx.dart';
import '../models/product.dart';

part 'edit_product_store.g.dart';

class EditProductStore = _EditProductStore with _$EditProductStore;

abstract class _EditProductStore with Store {
  final ObservableList<Product> productsList;
  final Product originalProduct;

  _EditProductStore(this.productsList, this.originalProduct) {
    _initializeFields();
  }

  @observable
  String name = '';

  @observable
  String description = '';

  @observable
  String version = '';

  @observable
  String platform = 'Mobile';

  @observable
  String developer = '';

  @observable
  String link = '';

  @observable
  bool isSubmitting = false;

  @action
  void setName(String value) => name = value;

  @action
  void setDescription(String value) => description = value;

  @action
  void setVersion(String value) => version = value;

  @action
  void setPlatform(String value) => platform = value;

  @action
  void setDeveloper(String value) => developer = value;

  @action
  void setLink(String value) => link = value;

  void _initializeFields() {
    name = originalProduct.name;
    description = originalProduct.description;
    version = originalProduct.version;
    platform = originalProduct.platform;
    developer = originalProduct.developer;
    link = originalProduct.link;
  }

  @action
  bool updateProduct() {
    if (name.isEmpty || description.isEmpty || version.isEmpty || developer.isEmpty || link.isEmpty) {
      return false;
    }

    isSubmitting = true;

    final updatedProduct = originalProduct.copyWith(
      name: name,
      description: description,
      version: version,
      platform: platform,
      developer: developer,
      link: link,
      updatedAt: DateTime.now(),
    );

    final index = productsList.indexWhere((p) => p.id == updatedProduct.id);
    if (index != -1) {
      productsList[index] = updatedProduct;
    }

    isSubmitting = false;
    return true;
  }
}


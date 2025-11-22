import 'package:mobx/mobx.dart';
import '../models/product.dart';

part 'create_product_store.g.dart';

class CreateProductStore = _CreateProductStore with _$CreateProductStore;

abstract class _CreateProductStore with Store {
  final ObservableList<Product> productsList;

  _CreateProductStore(this.productsList);

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

  @action
  bool createProduct() {
    if (name.isEmpty || description.isEmpty || version.isEmpty || developer.isEmpty || link.isEmpty) {
      return false;
    }

    isSubmitting = true;

    final product = Product(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      description: description,
      version: version,
      platform: platform,
      developer: developer,
      link: link,
      createdAt: DateTime.now(),
    );

    productsList.add(product);

    isSubmitting = false;
    return true;
  }
}


// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductsListStore on _ProductsListStore, Store {
  Computed<List<Product>>? _$filteredProductsComputed;

  @override
  List<Product> get filteredProducts =>
      (_$filteredProductsComputed ??= Computed<List<Product>>(
        () => super.filteredProducts,
        name: '_ProductsListStore.filteredProducts',
      )).value;

  late final _$searchQueryAtom = Atom(
    name: '_ProductsListStore.searchQuery',
    context: context,
  );

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$platformFilterAtom = Atom(
    name: '_ProductsListStore.platformFilter',
    context: context,
  );

  @override
  String? get platformFilter {
    _$platformFilterAtom.reportRead();
    return super.platformFilter;
  }

  @override
  set platformFilter(String? value) {
    _$platformFilterAtom.reportWrite(value, super.platformFilter, () {
      super.platformFilter = value;
    });
  }

  late final _$_ProductsListStoreActionController = ActionController(
    name: '_ProductsListStore',
    context: context,
  );

  @override
  void setSearchQuery(String value) {
    final _$actionInfo = _$_ProductsListStoreActionController.startAction(
      name: '_ProductsListStore.setSearchQuery',
    );
    try {
      return super.setSearchQuery(value);
    } finally {
      _$_ProductsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlatformFilter(String? value) {
    final _$actionInfo = _$_ProductsListStoreActionController.startAction(
      name: '_ProductsListStore.setPlatformFilter',
    );
    try {
      return super.setPlatformFilter(value);
    } finally {
      _$_ProductsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFilters() {
    final _$actionInfo = _$_ProductsListStoreActionController.startAction(
      name: '_ProductsListStore.clearFilters',
    );
    try {
      return super.clearFilters();
    } finally {
      _$_ProductsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateProduct(Product updatedProduct) {
    final _$actionInfo = _$_ProductsListStoreActionController.startAction(
      name: '_ProductsListStore.updateProduct',
    );
    try {
      return super.updateProduct(updatedProduct);
    } finally {
      _$_ProductsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchQuery: ${searchQuery},
platformFilter: ${platformFilter},
filteredProducts: ${filteredProducts}
    ''';
  }
}

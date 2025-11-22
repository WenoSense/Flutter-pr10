// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateProductStore on _CreateProductStore, Store {
  late final _$nameAtom = Atom(
    name: '_CreateProductStore.name',
    context: context,
  );

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$descriptionAtom = Atom(
    name: '_CreateProductStore.description',
    context: context,
  );

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$versionAtom = Atom(
    name: '_CreateProductStore.version',
    context: context,
  );

  @override
  String get version {
    _$versionAtom.reportRead();
    return super.version;
  }

  @override
  set version(String value) {
    _$versionAtom.reportWrite(value, super.version, () {
      super.version = value;
    });
  }

  late final _$platformAtom = Atom(
    name: '_CreateProductStore.platform',
    context: context,
  );

  @override
  String get platform {
    _$platformAtom.reportRead();
    return super.platform;
  }

  @override
  set platform(String value) {
    _$platformAtom.reportWrite(value, super.platform, () {
      super.platform = value;
    });
  }

  late final _$developerAtom = Atom(
    name: '_CreateProductStore.developer',
    context: context,
  );

  @override
  String get developer {
    _$developerAtom.reportRead();
    return super.developer;
  }

  @override
  set developer(String value) {
    _$developerAtom.reportWrite(value, super.developer, () {
      super.developer = value;
    });
  }

  late final _$linkAtom = Atom(
    name: '_CreateProductStore.link',
    context: context,
  );

  @override
  String get link {
    _$linkAtom.reportRead();
    return super.link;
  }

  @override
  set link(String value) {
    _$linkAtom.reportWrite(value, super.link, () {
      super.link = value;
    });
  }

  late final _$isSubmittingAtom = Atom(
    name: '_CreateProductStore.isSubmitting',
    context: context,
  );

  @override
  bool get isSubmitting {
    _$isSubmittingAtom.reportRead();
    return super.isSubmitting;
  }

  @override
  set isSubmitting(bool value) {
    _$isSubmittingAtom.reportWrite(value, super.isSubmitting, () {
      super.isSubmitting = value;
    });
  }

  late final _$_CreateProductStoreActionController = ActionController(
    name: '_CreateProductStore',
    context: context,
  );

  @override
  void setName(String value) {
    final _$actionInfo = _$_CreateProductStoreActionController.startAction(
      name: '_CreateProductStore.setName',
    );
    try {
      return super.setName(value);
    } finally {
      _$_CreateProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_CreateProductStoreActionController.startAction(
      name: '_CreateProductStore.setDescription',
    );
    try {
      return super.setDescription(value);
    } finally {
      _$_CreateProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVersion(String value) {
    final _$actionInfo = _$_CreateProductStoreActionController.startAction(
      name: '_CreateProductStore.setVersion',
    );
    try {
      return super.setVersion(value);
    } finally {
      _$_CreateProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlatform(String value) {
    final _$actionInfo = _$_CreateProductStoreActionController.startAction(
      name: '_CreateProductStore.setPlatform',
    );
    try {
      return super.setPlatform(value);
    } finally {
      _$_CreateProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDeveloper(String value) {
    final _$actionInfo = _$_CreateProductStoreActionController.startAction(
      name: '_CreateProductStore.setDeveloper',
    );
    try {
      return super.setDeveloper(value);
    } finally {
      _$_CreateProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLink(String value) {
    final _$actionInfo = _$_CreateProductStoreActionController.startAction(
      name: '_CreateProductStore.setLink',
    );
    try {
      return super.setLink(value);
    } finally {
      _$_CreateProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool createProduct() {
    final _$actionInfo = _$_CreateProductStoreActionController.startAction(
      name: '_CreateProductStore.createProduct',
    );
    try {
      return super.createProduct();
    } finally {
      _$_CreateProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
description: ${description},
version: ${version},
platform: ${platform},
developer: ${developer},
link: ${link},
isSubmitting: ${isSubmitting}
    ''';
  }
}

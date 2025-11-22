// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileViewStore on _ProfileViewStore, Store {
  Computed<String>? _$fullNameComputed;

  @override
  String get fullName => (_$fullNameComputed ??= Computed<String>(
    () => super.fullName,
    name: '_ProfileViewStore.fullName',
  )).value;

  late final _$firstNameAtom = Atom(
    name: '_ProfileViewStore.firstName',
    context: context,
  );

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  late final _$lastNameAtom = Atom(
    name: '_ProfileViewStore.lastName',
    context: context,
  );

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  late final _$emailAtom = Atom(
    name: '_ProfileViewStore.email',
    context: context,
  );

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$bioAtom = Atom(name: '_ProfileViewStore.bio', context: context);

  @override
  String get bio {
    _$bioAtom.reportRead();
    return super.bio;
  }

  @override
  set bio(String value) {
    _$bioAtom.reportWrite(value, super.bio, () {
      super.bio = value;
    });
  }

  late final _$_ProfileViewStoreActionController = ActionController(
    name: '_ProfileViewStore',
    context: context,
  );

  @override
  void _loadUserData() {
    final _$actionInfo = _$_ProfileViewStoreActionController.startAction(
      name: '_ProfileViewStore._loadUserData',
    );
    try {
      return super._loadUserData();
    } finally {
      _$_ProfileViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logout() {
    final _$actionInfo = _$_ProfileViewStoreActionController.startAction(
      name: '_ProfileViewStore.logout',
    );
    try {
      return super.logout();
    } finally {
      _$_ProfileViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reload() {
    final _$actionInfo = _$_ProfileViewStoreActionController.startAction(
      name: '_ProfileViewStore.reload',
    );
    try {
      return super.reload();
    } finally {
      _$_ProfileViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
firstName: ${firstName},
lastName: ${lastName},
email: ${email},
bio: ${bio},
fullName: ${fullName}
    ''';
  }
}

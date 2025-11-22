// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_edit_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileEditStore on _ProfileEditStore, Store {
  late final _$firstNameAtom = Atom(
    name: '_ProfileEditStore.firstName',
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
    name: '_ProfileEditStore.lastName',
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
    name: '_ProfileEditStore.email',
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

  late final _$bioAtom = Atom(name: '_ProfileEditStore.bio', context: context);

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

  late final _$isLoadingAtom = Atom(
    name: '_ProfileEditStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_ProfileEditStore.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$_ProfileEditStoreActionController = ActionController(
    name: '_ProfileEditStore',
    context: context,
  );

  @override
  void _loadUserData() {
    final _$actionInfo = _$_ProfileEditStoreActionController.startAction(
      name: '_ProfileEditStore._loadUserData',
    );
    try {
      return super._loadUserData();
    } finally {
      _$_ProfileEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFirstName(String value) {
    final _$actionInfo = _$_ProfileEditStoreActionController.startAction(
      name: '_ProfileEditStore.setFirstName',
    );
    try {
      return super.setFirstName(value);
    } finally {
      _$_ProfileEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLastName(String value) {
    final _$actionInfo = _$_ProfileEditStoreActionController.startAction(
      name: '_ProfileEditStore.setLastName',
    );
    try {
      return super.setLastName(value);
    } finally {
      _$_ProfileEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_ProfileEditStoreActionController.startAction(
      name: '_ProfileEditStore.setEmail',
    );
    try {
      return super.setEmail(value);
    } finally {
      _$_ProfileEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBio(String value) {
    final _$actionInfo = _$_ProfileEditStoreActionController.startAction(
      name: '_ProfileEditStore.setBio',
    );
    try {
      return super.setBio(value);
    } finally {
      _$_ProfileEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool saveProfile() {
    final _$actionInfo = _$_ProfileEditStoreActionController.startAction(
      name: '_ProfileEditStore.saveProfile',
    );
    try {
      return super.saveProfile();
    } finally {
      _$_ProfileEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
firstName: ${firstName},
lastName: ${lastName},
email: ${email},
bio: ${bio},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}

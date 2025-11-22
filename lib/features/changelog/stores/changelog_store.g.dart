// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'changelog_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChangelogStore on _ChangelogStore, Store {
  late final _$entriesAtom = Atom(
    name: '_ChangelogStore.entries',
    context: context,
  );

  @override
  ObservableList<ChangelogEntry> get entries {
    _$entriesAtom.reportRead();
    return super.entries;
  }

  @override
  set entries(ObservableList<ChangelogEntry> value) {
    _$entriesAtom.reportWrite(value, super.entries, () {
      super.entries = value;
    });
  }

  @override
  String toString() {
    return '''
entries: ${entries}
    ''';
  }
}

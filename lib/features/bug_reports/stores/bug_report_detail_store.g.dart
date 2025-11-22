// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bug_report_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BugReportDetailStore on _BugReportDetailStore, Store {
  Computed<BugReport?>? _$bugReportComputed;

  @override
  BugReport? get bugReport => (_$bugReportComputed ??= Computed<BugReport?>(
    () => super.bugReport,
    name: '_BugReportDetailStore.bugReport',
  )).value;

  @override
  String toString() {
    return '''
bugReport: ${bugReport}
    ''';
  }
}

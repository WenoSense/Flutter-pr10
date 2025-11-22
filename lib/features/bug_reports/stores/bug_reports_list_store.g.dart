// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bug_reports_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BugReportsListStore on _BugReportsListStore, Store {
  Computed<List<BugReport>>? _$filteredBugReportsComputed;

  @override
  List<BugReport> get filteredBugReports =>
      (_$filteredBugReportsComputed ??= Computed<List<BugReport>>(
        () => super.filteredBugReports,
        name: '_BugReportsListStore.filteredBugReports',
      )).value;

  late final _$searchQueryAtom = Atom(
    name: '_BugReportsListStore.searchQuery',
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

  late final _$severityFilterAtom = Atom(
    name: '_BugReportsListStore.severityFilter',
    context: context,
  );

  @override
  BugSeverity? get severityFilter {
    _$severityFilterAtom.reportRead();
    return super.severityFilter;
  }

  @override
  set severityFilter(BugSeverity? value) {
    _$severityFilterAtom.reportWrite(value, super.severityFilter, () {
      super.severityFilter = value;
    });
  }

  late final _$statusFilterAtom = Atom(
    name: '_BugReportsListStore.statusFilter',
    context: context,
  );

  @override
  BugStatus? get statusFilter {
    _$statusFilterAtom.reportRead();
    return super.statusFilter;
  }

  @override
  set statusFilter(BugStatus? value) {
    _$statusFilterAtom.reportWrite(value, super.statusFilter, () {
      super.statusFilter = value;
    });
  }

  late final _$productFilterAtom = Atom(
    name: '_BugReportsListStore.productFilter',
    context: context,
  );

  @override
  String? get productFilter {
    _$productFilterAtom.reportRead();
    return super.productFilter;
  }

  @override
  set productFilter(String? value) {
    _$productFilterAtom.reportWrite(value, super.productFilter, () {
      super.productFilter = value;
    });
  }

  late final _$_BugReportsListStoreActionController = ActionController(
    name: '_BugReportsListStore',
    context: context,
  );

  @override
  void setSearchQuery(String value) {
    final _$actionInfo = _$_BugReportsListStoreActionController.startAction(
      name: '_BugReportsListStore.setSearchQuery',
    );
    try {
      return super.setSearchQuery(value);
    } finally {
      _$_BugReportsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeverityFilter(BugSeverity? value) {
    final _$actionInfo = _$_BugReportsListStoreActionController.startAction(
      name: '_BugReportsListStore.setSeverityFilter',
    );
    try {
      return super.setSeverityFilter(value);
    } finally {
      _$_BugReportsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatusFilter(BugStatus? value) {
    final _$actionInfo = _$_BugReportsListStoreActionController.startAction(
      name: '_BugReportsListStore.setStatusFilter',
    );
    try {
      return super.setStatusFilter(value);
    } finally {
      _$_BugReportsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductFilter(String? value) {
    final _$actionInfo = _$_BugReportsListStoreActionController.startAction(
      name: '_BugReportsListStore.setProductFilter',
    );
    try {
      return super.setProductFilter(value);
    } finally {
      _$_BugReportsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFilters() {
    final _$actionInfo = _$_BugReportsListStoreActionController.startAction(
      name: '_BugReportsListStore.clearFilters',
    );
    try {
      return super.clearFilters();
    } finally {
      _$_BugReportsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateBugReport(BugReport updatedBug) {
    final _$actionInfo = _$_BugReportsListStoreActionController.startAction(
      name: '_BugReportsListStore.updateBugReport',
    );
    try {
      return super.updateBugReport(updatedBug);
    } finally {
      _$_BugReportsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchQuery: ${searchQuery},
severityFilter: ${severityFilter},
statusFilter: ${statusFilter},
productFilter: ${productFilter},
filteredBugReports: ${filteredBugReports}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_bug_report_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditBugReportStore on _EditBugReportStore, Store {
  late final _$titleAtom = Atom(
    name: '_EditBugReportStore.title',
    context: context,
  );

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$stepsToReproduceAtom = Atom(
    name: '_EditBugReportStore.stepsToReproduce',
    context: context,
  );

  @override
  String get stepsToReproduce {
    _$stepsToReproduceAtom.reportRead();
    return super.stepsToReproduce;
  }

  @override
  set stepsToReproduce(String value) {
    _$stepsToReproduceAtom.reportWrite(value, super.stepsToReproduce, () {
      super.stepsToReproduce = value;
    });
  }

  late final _$actualResultAtom = Atom(
    name: '_EditBugReportStore.actualResult',
    context: context,
  );

  @override
  String get actualResult {
    _$actualResultAtom.reportRead();
    return super.actualResult;
  }

  @override
  set actualResult(String value) {
    _$actualResultAtom.reportWrite(value, super.actualResult, () {
      super.actualResult = value;
    });
  }

  late final _$expectedResultAtom = Atom(
    name: '_EditBugReportStore.expectedResult',
    context: context,
  );

  @override
  String get expectedResult {
    _$expectedResultAtom.reportRead();
    return super.expectedResult;
  }

  @override
  set expectedResult(String value) {
    _$expectedResultAtom.reportWrite(value, super.expectedResult, () {
      super.expectedResult = value;
    });
  }

  late final _$selectedProductIdAtom = Atom(
    name: '_EditBugReportStore.selectedProductId',
    context: context,
  );

  @override
  String get selectedProductId {
    _$selectedProductIdAtom.reportRead();
    return super.selectedProductId;
  }

  @override
  set selectedProductId(String value) {
    _$selectedProductIdAtom.reportWrite(value, super.selectedProductId, () {
      super.selectedProductId = value;
    });
  }

  late final _$selectedProductNameAtom = Atom(
    name: '_EditBugReportStore.selectedProductName',
    context: context,
  );

  @override
  String get selectedProductName {
    _$selectedProductNameAtom.reportRead();
    return super.selectedProductName;
  }

  @override
  set selectedProductName(String value) {
    _$selectedProductNameAtom.reportWrite(value, super.selectedProductName, () {
      super.selectedProductName = value;
    });
  }

  late final _$severityAtom = Atom(
    name: '_EditBugReportStore.severity',
    context: context,
  );

  @override
  BugSeverity get severity {
    _$severityAtom.reportRead();
    return super.severity;
  }

  @override
  set severity(BugSeverity value) {
    _$severityAtom.reportWrite(value, super.severity, () {
      super.severity = value;
    });
  }

  late final _$statusAtom = Atom(
    name: '_EditBugReportStore.status',
    context: context,
  );

  @override
  BugStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(BugStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$isSubmittingAtom = Atom(
    name: '_EditBugReportStore.isSubmitting',
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

  late final _$_EditBugReportStoreActionController = ActionController(
    name: '_EditBugReportStore',
    context: context,
  );

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_EditBugReportStoreActionController.startAction(
      name: '_EditBugReportStore.setTitle',
    );
    try {
      return super.setTitle(value);
    } finally {
      _$_EditBugReportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStepsToReproduce(String value) {
    final _$actionInfo = _$_EditBugReportStoreActionController.startAction(
      name: '_EditBugReportStore.setStepsToReproduce',
    );
    try {
      return super.setStepsToReproduce(value);
    } finally {
      _$_EditBugReportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setActualResult(String value) {
    final _$actionInfo = _$_EditBugReportStoreActionController.startAction(
      name: '_EditBugReportStore.setActualResult',
    );
    try {
      return super.setActualResult(value);
    } finally {
      _$_EditBugReportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExpectedResult(String value) {
    final _$actionInfo = _$_EditBugReportStoreActionController.startAction(
      name: '_EditBugReportStore.setExpectedResult',
    );
    try {
      return super.setExpectedResult(value);
    } finally {
      _$_EditBugReportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProduct(String id, String name) {
    final _$actionInfo = _$_EditBugReportStoreActionController.startAction(
      name: '_EditBugReportStore.setProduct',
    );
    try {
      return super.setProduct(id, name);
    } finally {
      _$_EditBugReportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeverity(BugSeverity value) {
    final _$actionInfo = _$_EditBugReportStoreActionController.startAction(
      name: '_EditBugReportStore.setSeverity',
    );
    try {
      return super.setSeverity(value);
    } finally {
      _$_EditBugReportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(BugStatus value) {
    final _$actionInfo = _$_EditBugReportStoreActionController.startAction(
      name: '_EditBugReportStore.setStatus',
    );
    try {
      return super.setStatus(value);
    } finally {
      _$_EditBugReportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool updateBugReport() {
    final _$actionInfo = _$_EditBugReportStoreActionController.startAction(
      name: '_EditBugReportStore.updateBugReport',
    );
    try {
      return super.updateBugReport();
    } finally {
      _$_EditBugReportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
stepsToReproduce: ${stepsToReproduce},
actualResult: ${actualResult},
expectedResult: ${expectedResult},
selectedProductId: ${selectedProductId},
selectedProductName: ${selectedProductName},
severity: ${severity},
status: ${status},
isSubmitting: ${isSubmitting}
    ''';
  }
}

import 'package:mobx/mobx.dart';
import '../models/bug_report.dart';

part 'edit_bug_report_store.g.dart';

class EditBugReportStore = _EditBugReportStore with _$EditBugReportStore;

abstract class _EditBugReportStore with Store {
  final ObservableList<BugReport> bugReportsList;
  final BugReport originalBugReport;

  _EditBugReportStore(this.bugReportsList, this.originalBugReport) {
    _initializeFields();
  }

  @observable
  String title = '';

  @observable
  String stepsToReproduce = '';

  @observable
  String actualResult = '';

  @observable
  String expectedResult = '';

  @observable
  String selectedProductId = '';

  @observable
  String selectedProductName = '';

  @observable
  BugSeverity severity = BugSeverity.low;

  @observable
  BugStatus status = BugStatus.open;

  @observable
  bool isSubmitting = false;

  @action
  void setTitle(String value) => title = value;

  @action
  void setStepsToReproduce(String value) => stepsToReproduce = value;

  @action
  void setActualResult(String value) => actualResult = value;

  @action
  void setExpectedResult(String value) => expectedResult = value;

  @action
  void setProduct(String id, String name) {
    selectedProductId = id;
    selectedProductName = name;
  }

  @action
  void setSeverity(BugSeverity value) => severity = value;

  @action
  void setStatus(BugStatus value) => status = value;

  void _initializeFields() {
    title = originalBugReport.title;
    stepsToReproduce = originalBugReport.stepsToReproduce;
    actualResult = originalBugReport.actualResult;
    expectedResult = originalBugReport.expectedResult;
    selectedProductId = originalBugReport.productId;
    selectedProductName = originalBugReport.productName;
    severity = originalBugReport.severity;
    status = originalBugReport.status;
  }

  @action
  bool updateBugReport() {
    if (title.isEmpty || stepsToReproduce.isEmpty || actualResult.isEmpty || expectedResult.isEmpty || selectedProductId.isEmpty) {
      return false;
    }

    isSubmitting = true;

    final updatedBugReport = originalBugReport.copyWith(
      title: title,
      stepsToReproduce: stepsToReproduce,
      actualResult: actualResult,
      expectedResult: expectedResult,
      productId: selectedProductId,
      productName: selectedProductName,
      severity: severity,
      status: status,
      updatedAt: DateTime.now(),
    );

    final index = bugReportsList.indexWhere((b) => b.id == updatedBugReport.id);
    if (index != -1) {
      bugReportsList[index] = updatedBugReport;
    }

    isSubmitting = false;
    return true;
  }
}


import 'package:mobx/mobx.dart';
import '../models/bug_report.dart';
import '../../auth/stores/login_store.dart';

part 'create_bug_report_store.g.dart';

class CreateBugReportStore = _CreateBugReportStore with _$CreateBugReportStore;

abstract class _CreateBugReportStore with Store {
  final LoginStore loginStore;
  final ObservableList<BugReport> bugReportsList;

  _CreateBugReportStore(this.loginStore, this.bugReportsList);

  @observable
  String title = '';

  @observable
  String stepsToReproduce = '';

  @observable
  String actualResult = '';

  @observable
  String expectedResult = '';

  @observable
  String? selectedProductId;

  @observable
  String selectedProductName = '';

  @observable
  BugSeverity severity = BugSeverity.medium;

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
  bool createBugReport() {
    if (title.isEmpty || stepsToReproduce.isEmpty || actualResult.isEmpty || expectedResult.isEmpty || selectedProductId == null) {
      return false;
    }

    isSubmitting = true;

    final bug = BugReport(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      stepsToReproduce: stepsToReproduce,
      actualResult: actualResult,
      expectedResult: expectedResult,
      productId: selectedProductId!,
      productName: selectedProductName,
      severity: severity,
      status: BugStatus.open,
      reportedBy: loginStore.currentUser?.email ?? 'unknown',
      createdAt: DateTime.now(),
    );

    bugReportsList.add(bug);

    isSubmitting = false;
    return true;
  }
}


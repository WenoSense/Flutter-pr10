import 'package:mobx/mobx.dart';
import '../models/bug_report.dart';

part 'bug_reports_list_store.g.dart';

class BugReportsListStore = _BugReportsListStore with _$BugReportsListStore;

abstract class _BugReportsListStore with Store {
  final ObservableList<BugReport> allBugReports;

  _BugReportsListStore(this.allBugReports);

  @observable
  String searchQuery = '';

  @observable
  BugSeverity? severityFilter;

  @observable
  BugStatus? statusFilter;

  @observable
  String? productFilter;

  @computed
  List<BugReport> get filteredBugReports {
    var reports = allBugReports.toList();

    if (searchQuery.isNotEmpty) {
      reports = reports.where((bug) {
        return bug.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
            bug.stepsToReproduce.toLowerCase().contains(searchQuery.toLowerCase()) ||
            bug.actualResult.toLowerCase().contains(searchQuery.toLowerCase()) ||
            bug.expectedResult.toLowerCase().contains(searchQuery.toLowerCase()) ||
            bug.productName.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }

    if (severityFilter != null) {
      reports = reports.where((bug) => bug.severity == severityFilter).toList();
    }

    if (statusFilter != null) {
      reports = reports.where((bug) => bug.status == statusFilter).toList();
    }

    if (productFilter != null && productFilter!.isNotEmpty) {
      reports = reports.where((bug) => bug.productId == productFilter).toList();
    }

    return reports;
  }

  @action
  void setSearchQuery(String value) => searchQuery = value;

  @action
  void setSeverityFilter(BugSeverity? value) => severityFilter = value;

  @action
  void setStatusFilter(BugStatus? value) => statusFilter = value;

  @action
  void setProductFilter(String? value) => productFilter = value;

  @action
  void clearFilters() {
    searchQuery = '';
    severityFilter = null;
    statusFilter = null;
    productFilter = null;
  }

  @action
  void updateBugReport(BugReport updatedBug) {
    final index = allBugReports.indexWhere((b) => b.id == updatedBug.id);
    if (index != -1) {
      allBugReports[index] = updatedBug;
    }
  }
}


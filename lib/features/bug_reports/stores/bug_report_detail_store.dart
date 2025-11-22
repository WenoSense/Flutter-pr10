import 'package:mobx/mobx.dart';
import '../models/bug_report.dart';

part 'bug_report_detail_store.g.dart';

class BugReportDetailStore = _BugReportDetailStore with _$BugReportDetailStore;

abstract class _BugReportDetailStore with Store {
  final String bugId;
  final ObservableList<BugReport> bugReportsList;

  _BugReportDetailStore(this.bugId, this.bugReportsList);

  @computed
  BugReport? get bugReport {
    try {
      return bugReportsList.firstWhere((b) => b.id == bugId);
    } catch (e) {
      return null;
    }
  }
}


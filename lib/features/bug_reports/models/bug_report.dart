enum BugSeverity { low, medium, high, critical }

enum BugStatus { open, inProgress, resolved, closed }

class BugReport {
  final String id;
  final String title;
  final String stepsToReproduce;
  final String actualResult;
  final String expectedResult;
  final String productId;
  final String productName;
  final BugSeverity severity;
  final BugStatus status;
  final String reportedBy;
  final DateTime createdAt;
  final DateTime? updatedAt;

  BugReport({
    required this.id,
    required this.title,
    required this.stepsToReproduce,
    required this.actualResult,
    required this.expectedResult,
    required this.productId,
    required this.productName,
    required this.severity,
    required this.status,
    required this.reportedBy,
    required this.createdAt,
    this.updatedAt,
  });

  BugReport copyWith({
    String? id,
    String? title,
    String? stepsToReproduce,
    String? actualResult,
    String? expectedResult,
    String? productId,
    String? productName,
    BugSeverity? severity,
    BugStatus? status,
    String? reportedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return BugReport(
      id: id ?? this.id,
      title: title ?? this.title,
      stepsToReproduce: stepsToReproduce ?? this.stepsToReproduce,
      actualResult: actualResult ?? this.actualResult,
      expectedResult: expectedResult ?? this.expectedResult,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      severity: severity ?? this.severity,
      status: status ?? this.status,
      reportedBy: reportedBy ?? this.reportedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}


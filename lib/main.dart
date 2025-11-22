import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'app.dart';
import 'features/auth/stores/login_store.dart';
import 'features/products/models/product.dart';
import 'features/bug_reports/models/bug_report.dart';
import 'features/feedback/models/feedback_item.dart';

void main() {
  GetIt.I.registerSingleton<LoginStore>(LoginStore());
  GetIt.I.registerSingleton<ObservableList<Product>>(ObservableList<Product>());
  GetIt.I.registerSingleton<ObservableList<BugReport>>(ObservableList<BugReport>());
  GetIt.I.registerSingleton<ObservableList<FeedbackItem>>(ObservableList<FeedbackItem>());

  runApp(const MyApp());
}

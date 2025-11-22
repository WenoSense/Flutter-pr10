import 'package:mobx/mobx.dart';
import '../models/feedback_item.dart';
import '../../auth/stores/login_store.dart';

part 'feedback_store.g.dart';

class FeedbackStore = _FeedbackStore with _$FeedbackStore;

abstract class _FeedbackStore with Store {
  final LoginStore loginStore;
  final ObservableList<FeedbackItem> allFeedbacks;

  _FeedbackStore(this.loginStore, this.allFeedbacks);

  @observable
  String title = '';

  @observable
  String message = '';

  @observable
  bool isSubmitting = false;

  @action
  void setTitle(String value) => title = value;

  @action
  void setMessage(String value) => message = value;

  @action
  bool submitFeedback() {
    if (title.isEmpty || message.isEmpty) {
      return false;
    }

    isSubmitting = true;

    final feedback = FeedbackItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      message: message,
      authorEmail: loginStore.currentUser?.email ?? 'anonymous',
      createdAt: DateTime.now(),
    );

    allFeedbacks.add(feedback);

    title = '';
    message = '';
    isSubmitting = false;

    return true;
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import '../stores/feedback_store.dart';
import '../models/feedback_item.dart';
import '../../auth/stores/login_store.dart';
import '../../widgets/app_drawer.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = FeedbackStore(
      GetIt.I<LoginStore>(),
      GetIt.I<ObservableList<FeedbackItem>>(),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Отзывы и предложения'),
      ),
      drawer: const AppDrawer(currentRoute: '/feedback'),
      body: Observer(
        builder: (_) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Заголовок',
                  border: OutlineInputBorder(),
                ),
                onChanged: store.setTitle,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Сообщение',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: 5,
                onChanged: store.setMessage,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: store.isSubmitting
                    ? null
                    : () {
                        store.submitFeedback();
                      },
                child: store.isSubmitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Отправить'),
              ),
              const SizedBox(height: 32),
              const Text(
                'Список отзывов',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              if (store.allFeedbacks.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Отзывов пока нет',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              else
                ...store.allFeedbacks.map((feedback) => Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.person, size: 16, color: Colors.black),
                                const SizedBox(width: 4),
                                Text(
                                  feedback.authorEmail,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  DateFormat('dd.MM.yyyy').format(feedback.createdAt),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              feedback.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(feedback.message),
                          ],
                        ),
                      ),
                    )),
            ],
          ),
        ),
      ),
    );
  }

}


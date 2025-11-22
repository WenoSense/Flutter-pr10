import 'package:mobx/mobx.dart';
import '../models/onboarding_page.dart';
import 'package:flutter/material.dart';

part 'onboarding_store.g.dart';

class OnboardingStore = _OnboardingStore with _$OnboardingStore;

abstract class _OnboardingStore with Store {
  final List<OnboardingPage> pages = [
    OnboardingPage(
      title: 'Добро пожаловать!',
      description: 'Система для управления баг-репортами и программными продуктами',
      icon: Icons.bug_report,
      color: Colors.blue,
    ),
    OnboardingPage(
      title: 'Управляйте программными продуктами',
      description: 'Создавайте и редактируйте свои программные продукты, указывайте платформы и версии, а также быстро находите нужный продукт через поиск и фильтры.',
      icon: Icons.inventory_2,
      color: Colors.green,
    ),
    OnboardingPage(
      title: 'Управляйте баг-репортами',
      description: 'Фиксируйте баги с шагами воспроизведения, ожидаемым и фактическим результатом, устанавилвайте приоритет и статус и находите нужные баг-репорты через поиск и фильтры.',
      icon: Icons.track_changes,
      color: Colors.orange,
    ),
    OnboardingPage(
      title: 'Оставляйте отзывы и предложения о системе',
      description: 'Расскажите, что вам нравится, чего сейчас не хватает и какие улучшения вы хотели бы видеть в системе.',
      icon: Icons.feedback,
      color: Colors.purple,
    ),
    OnboardingPage(
      title: 'Следите за развитием системы',
      description:
      'Следите в разделе "История изменений" за развитием баг-трекера: новые возможности, улучшения интерфейса и исправления ошибок приложения',
      icon: Icons.timeline,
      color: Colors.green,
    ),
  ];

  @observable
  int currentPage = 0;

  @computed
  bool get isLastPage => currentPage == pages.length - 1;

  @computed
  bool get isFirstPage => currentPage == 0;

  @action
  void setPage(int page) {
    currentPage = page;
  }

  @action
  void nextPage() {
    if (currentPage < pages.length - 1) {
      currentPage++;
    }
  }

  @action
  void previousPage() {
    if (currentPage > 0) {
      currentPage--;
    }
  }

  @action
  void reset() {
    currentPage = 0;
  }
}


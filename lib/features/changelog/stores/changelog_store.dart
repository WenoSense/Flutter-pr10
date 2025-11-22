import 'package:mobx/mobx.dart';
import '../models/changelog_entry.dart';

part 'changelog_store.g.dart';

class ChangelogStore = _ChangelogStore with _$ChangelogStore;

abstract class _ChangelogStore with Store {
  _ChangelogStore() {
    _initSampleData();
  }

  @observable
  ObservableList<ChangelogEntry> entries = ObservableList<ChangelogEntry>();

  void _initSampleData() {
    entries.addAll([
      ChangelogEntry(
        id: '1',
        version: '1.2.0',
        title: 'Новые функции и улучшения',
        description: 'Добавлены новые возможности для работы с баг-репортами',
        changes: [
          'Добавлена фильтрация баг-репортов по статусу',
          'Улучшен поиск по продуктам',
          'Исправлены ошибки в отображении профиля',
          'Оптимизирована производительность',
        ],
        releaseDate: DateTime.now().subtract(const Duration(days: 7)),
      ),
      ChangelogEntry(
        id: '2',
        version: '1.1.0',
        title: 'Система отзывов',
        description: 'Добавлена возможность оставлять отзывы и предложения',
        changes: [
          'Новый раздел для отзывов и предложений',
          'Улучшена навигация между экранами',
          'Добавлены уведомления',
        ],
        releaseDate: DateTime.now().subtract(const Duration(days: 30)),
      ),
      ChangelogEntry(
        id: '3',
        version: '1.0.0',
        title: 'Первый релиз',
        description: 'Первая версия баг-трекинговой системы',
        changes: [
          'Система авторизации и регистрации',
          'Управление баг-репортами',
          'Управление продуктами',
          'Профиль пользователя',
        ],
        releaseDate: DateTime.now().subtract(const Duration(days: 60)),
      ),
    ]);
  }
}


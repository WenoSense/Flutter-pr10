import 'package:mobx/mobx.dart';
import '../models/user.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore();

  final List<User> _users = [];
  
  @observable
  User? currentUser;

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @computed
  bool get isAuthenticated => currentUser != null;

  @action
  void setEmail(String value) {
    email = value;
    errorMessage = null;
  }

  @action
  void setPassword(String value) {
    password = value;
    errorMessage = null;
  }

  @action
  bool login() {
    if (email.isEmpty || password.isEmpty) {
      errorMessage = 'Заполните все поля';
      return false;
    }

    isLoading = true;
    errorMessage = null;

    try {
      final user = _users.firstWhere(
        (u) => u.email == email && u.password == password,
      );
      currentUser = user;
      isLoading = false;
      return true;
    } catch (e) {
      errorMessage = 'Неверный email или пароль';
      isLoading = false;
      return false;
    }
  }

  @action
  bool register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    String? bio,
  }) {
    if (_users.any((u) => u.email == email)) {
      return false;
    }

    final user = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      bio: bio ?? '',
      createdAt: DateTime.now(),
    );

    _users.add(user);
    currentUser = user;
    return true;
  }

  @action
  void logout() {
    currentUser = null;
  }

  @action
  bool updateProfile({
    required String firstName,
    required String lastName,
    required String email,
    String? bio,
  }) {
    if (currentUser == null) return false;

    final updatedUser = currentUser!.copyWith(
      firstName: firstName,
      lastName: lastName,
      email: email,
      bio: bio,
    );

    final index = _users.indexWhere((u) => u.id == currentUser!.id);
    if (index != -1) {
      _users[index] = updatedUser;
      currentUser = updatedUser;
      return true;
    }
    return false;
  }

  @action
  void reset() {
    email = '';
    password = '';
    errorMessage = null;
  }
}


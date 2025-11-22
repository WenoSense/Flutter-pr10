import 'package:mobx/mobx.dart';
import 'login_store.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store {
  final LoginStore loginStore;

  _RegisterStore(this.loginStore);

  @observable
  String firstName = '';

  @observable
  String lastName = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String bio = '';

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  void setFirstName(String value) {
    firstName = value;
    errorMessage = null;
  }

  @action
  void setLastName(String value) {
    lastName = value;
    errorMessage = null;
  }

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
  void setBio(String value) {
    bio = value;
    errorMessage = null;
  }

  @action
  bool register() {
    if (firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty) {
      errorMessage = 'Заполните все обязательные поля';
      return false;
    }

    isLoading = true;
    errorMessage = null;

    final success = loginStore.register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      bio: bio,
    );

    if (!success) {
      errorMessage = 'Пользователь с таким email уже существует';
    }

    isLoading = false;
    return success;
  }

  @action
  void reset() {
    firstName = '';
    lastName = '';
    email = '';
    password = '';
    bio = '';
    errorMessage = null;
  }
}


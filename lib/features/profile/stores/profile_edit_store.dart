import 'package:mobx/mobx.dart';
import '../../auth/stores/login_store.dart';

part 'profile_edit_store.g.dart';

class ProfileEditStore = _ProfileEditStore with _$ProfileEditStore;

abstract class _ProfileEditStore with Store {
  final LoginStore loginStore;

  _ProfileEditStore(this.loginStore) {
    _loadUserData();
  }

  @observable
  String firstName = '';

  @observable
  String lastName = '';

  @observable
  String email = '';

  @observable
  String bio = '';

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  void _loadUserData() {
    final user = loginStore.currentUser;
    if (user != null) {
      firstName = user.firstName;
      lastName = user.lastName;
      email = user.email;
      bio = user.bio;
    }
  }

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
  void setBio(String value) {
    bio = value;
    errorMessage = null;
  }

  @action
  bool saveProfile() {
    if (firstName.isEmpty || lastName.isEmpty || email.isEmpty) {
      errorMessage = 'Заполните все обязательные поля';
      return false;
    }

    isLoading = true;
    errorMessage = null;

    final success = loginStore.updateProfile(
      firstName: firstName,
      lastName: lastName,
      email: email,
      bio: bio,
    );

    if (!success) {
      errorMessage = 'Не удалось обновить профиль';
    }

    isLoading = false;
    return success;
  }
}


import 'package:mobx/mobx.dart';
import '../../auth/stores/login_store.dart';

part 'profile_view_store.g.dart';

class ProfileViewStore = _ProfileViewStore with _$ProfileViewStore;

abstract class _ProfileViewStore with Store {
  final LoginStore loginStore;

  _ProfileViewStore(this.loginStore) {
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

  @computed
  String get fullName => '$firstName $lastName';

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
  void logout() {
    loginStore.logout();
  }

  @action
  void reload() {
    _loadUserData();
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../stores/profile_edit_store.dart';
import '../../auth/stores/login_store.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = ProfileEditStore(GetIt.I<LoginStore>());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Редактирование профиля'),
      ),
      body: Observer(
        builder: (_) => Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Имя',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(text: store.firstName)
                      ..selection = TextSelection.fromPosition(
                        TextPosition(offset: store.firstName.length),
                      ),
                    onChanged: store.setFirstName,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Фамилия',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(text: store.lastName)
                      ..selection = TextSelection.fromPosition(
                        TextPosition(offset: store.lastName.length),
                      ),
                    onChanged: store.setLastName,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(text: store.email)
                      ..selection = TextSelection.fromPosition(
                        TextPosition(offset: store.email.length),
                      ),
                    onChanged: store.setEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'О себе',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(text: store.bio)
                      ..selection = TextSelection.fromPosition(
                        TextPosition(offset: store.bio.length),
                      ),
                    onChanged: store.setBio,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 24),
                  if (store.errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        store.errorMessage!,
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ElevatedButton(
                  onPressed: store.isLoading
                      ? null
                      : () {
                            final success = store.saveProfile();
                            if (success) {
                              context.go('/profile');
                            }
                          },
                    child: store.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Сохранить'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  final String currentRoute;

  const AppDrawer({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Баг-трекер',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.bug_report),
            title: const Text('Баг-репорты'),
            selected: currentRoute == '/bug-reports',
            onTap: () => context.go('/bug-reports'),
          ),
          ListTile(
            leading: const Icon(Icons.apps),
            title: const Text('Программные продукты'),
            selected: currentRoute == '/products',
            onTap: () => context.go('/products'),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('История изменений'),
            selected: currentRoute == '/changelog',
            onTap: () => context.go('/changelog'),
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('Отзывы'),
            selected: currentRoute == '/feedback',
            onTap: () => context.go('/feedback'),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Профиль'),
            selected: currentRoute == '/profile',
            onTap: () => context.go('/profile'),
          ),
        ],
      ),
    );
  }
}


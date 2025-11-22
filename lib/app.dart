import 'package:flutter/material.dart';
import 'app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    
    return MaterialApp.router(
      title: 'Баг-трекер',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: appRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}


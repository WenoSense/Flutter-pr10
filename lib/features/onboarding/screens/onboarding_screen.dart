import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../stores/onboarding_store.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  void _skipOnboarding(BuildContext context) {
    context.go('/bug-reports');
  }

  void _nextPage(BuildContext context, OnboardingStore store) {
    if (store.isLastPage) {
      _skipOnboarding(context);
    } else {
      store.nextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final store = OnboardingStore();
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Observer(
                    builder: (_) => store.isLastPage
                        ? const SizedBox.shrink()
                        : TextButton(
                            onPressed: () => _skipOnboarding(context),
                            child: const Text(
                              'Пропустить',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  final page = store.pages[store.currentPage];
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0.3, 0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        ),
                      );
                    },
                    child: Padding(
                      key: ValueKey(store.currentPage),
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: page.color.withValues(alpha: 0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              page.icon,
                              size: 80,
                              color: page.color,
                            ),
                          ),
                          const SizedBox(height: 50),
                          Text(
                            page.title,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            page.description,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Observer(
                    builder: (_) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        store.pages.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: store.currentPage == index ? 24 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: store.currentPage == index
                                ? Theme.of(context).primaryColor
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: Observer(
                      builder: (_) => ElevatedButton(
                        onPressed: () => _nextPage(context, store),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          store.isLastPage ? 'Начать' : 'Далее',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


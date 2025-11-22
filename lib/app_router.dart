import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/auth/screens/register_screen.dart';
import 'features/auth/stores/login_store.dart';
import 'features/onboarding/screens/onboarding_screen.dart';
import 'features/profile/screens/profile_view_screen.dart';
import 'features/profile/screens/profile_edit_screen.dart';
import 'features/changelog/screens/changelog_screen.dart';
import 'features/feedback/screens/feedback_screen.dart';
import 'features/bug_reports/screens/bug_reports_screen.dart';
import 'features/bug_reports/screens/bug_report_detail_screen.dart';
import 'features/bug_reports/screens/create_bug_report_screen.dart';
import 'features/bug_reports/screens/edit_bug_report_screen.dart';
import 'features/products/screens/products_screen.dart';
import 'features/products/screens/product_detail_screen.dart';
import 'features/products/screens/create_product_screen.dart';
import 'features/products/screens/edit_product_screen.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final loginStore = GetIt.I<LoginStore>();
      final isAuthenticated = loginStore.isAuthenticated;
      final isAuthRoute = state.matchedLocation == '/' || state.matchedLocation == '/register';
      final isOnboardingRoute = state.matchedLocation == '/onboarding';

      if (!isAuthenticated && !isAuthRoute && !isOnboardingRoute) {
        return '/';
      }

      if (isAuthenticated && isAuthRoute) {
        return '/bug-reports';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileViewScreen(),
      ),
      GoRoute(
        path: '/profile/edit',
        builder: (context, state) => const ProfileEditScreen(),
      ),
      GoRoute(
        path: '/changelog',
        builder: (context, state) => const ChangelogScreen(),
      ),
      GoRoute(
        path: '/feedback',
        builder: (context, state) => const FeedbackScreen(),
      ),
      GoRoute(
        path: '/bug-reports',
        builder: (context, state) => const BugReportsScreen(),
      ),
      GoRoute(
        path: '/bug-reports/create',
        builder: (context, state) => const CreateBugReportScreen(),
      ),
      GoRoute(
        path: '/bug-reports/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return BugReportDetailScreen(bugReportId: id);
        },
      ),
      GoRoute(
        path: '/bug-reports/:id/edit',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return EditBugReportScreen(bugReportId: id);
        },
      ),
      GoRoute(
        path: '/products',
        builder: (context, state) => const ProductsScreen(),
      ),
      GoRoute(
        path: '/products/create',
        builder: (context, state) => const CreateProductScreen(),
      ),
      GoRoute(
        path: '/products/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ProductDetailScreen(productId: id);
        },
      ),
      GoRoute(
        path: '/products/:id/edit',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return EditProductScreen(productId: id);
        },
      ),
    ],
  );
}


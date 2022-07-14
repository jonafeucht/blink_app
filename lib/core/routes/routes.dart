import 'package:blinkapp/services/auth/login.dart';
import 'package:go_router/go_router.dart';

abstract class Routes {
  static GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, GoRouterState state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/page2',
        builder: (context, GoRouterState state) => const LoginScreen(),
      ),
    ],
  );
}

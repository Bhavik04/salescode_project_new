import 'package:go_router/go_router.dart';
import 'package:salescode_project/auth/auth_screen.dart';
import 'package:salescode_project/home/home_screen.dart';
import 'package:salescode_project/loading_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/auth',
    routes: [
      GoRoute(
        path: '/loading',
        name: LoadingScreen.routeName,
        builder: (context, state) => const LoadingScreen(),
        routes: [
          GoRoute(
            path: 'home',
            name: HomeScreen.routeName,
            builder: (context, state) => const HomeScreen()
          )
        ]
      ),
      GoRoute(
        path: '/auth',
        name: AuthScreen.routeName,
        builder: (context, state) => const AuthScreen()
      )
    ]
  );
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name.snakeCase()}}/features/features.dart';

class AppRouter {
  static GoRouter get router => _router;

  static const String counterRoute = '/counter-route';

  GoRouter config() => router;

  static GlobalKey<NavigatorState> get globalNavigatorKey =>
      GlobalKey<NavigatorState>();

  static final _router = GoRouter(
    initialLocation: counterRoute,
    navigatorKey: globalNavigatorKey,
    routes: [
      GoRoute(
        path: counterRoute,
        name: counterRoute,
        builder: (context, state) => const CounterPage(),
      ),
    ],
  );
}

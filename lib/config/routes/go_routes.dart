import 'package:action_manager_poc/core/widgets/navigation/app_scaffold.dart';
import 'package:action_manager_poc/features/app/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _navPersonalNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'navPersonal');

final _nav1NavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'nav1');
final _rootNavigatorKey = GlobalKey<NavigatorState>();

enum RoutePath {
  root(path: '/'),
  personal(path: '/Personal');

  final String path;
  const RoutePath({required this.path});
}

class AppGoRouter {
  static const navPersonal = '/Personal';
  static const navAkcie = '/Akcie';

  static final router = GoRouter(
    errorBuilder: (context, state) => Container(color: Colors.red),
    navigatorKey: _rootNavigatorKey,
    initialLocation: "/",
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: RoutePath.root.path,
        // redirect: (_, __) => RoutePath.personal.path,
        builder: (context, state) {
          return const HomePage();
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppScaffoldShell(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          // Nav1 branch
          StatefulShellBranch(
            initialLocation: navPersonal,
            navigatorKey: _navPersonalNavigatorKey,
            routes: [],
          )
        ],
      )
    ],
  );
}
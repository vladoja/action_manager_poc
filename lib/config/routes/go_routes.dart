import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _navPersonalNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'navPersonal');

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppGoRouter {
  static const navPersonal = '/Personal';

  static final router = GoRouter(
      errorBuilder: (context, state) => Container(color: Colors.red),
      navigatorKey: _rootNavigatorKey,
      initialLocation: "/",
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        GoRoute(
          path: "/",
          redirect: (_, __) => AppGoRouter.navPersonal,
        ),
        StatefulShellRoute.indexedStack(branches: <StatefulShellBranch>[
          // Nav1 branch
          StatefulShellBranch(
              initialLocation: AppGoRouter.navPersonal,
              navigatorKey: _navPersonalNavigatorKey,
              routes: [])
        ])
      ]);
}

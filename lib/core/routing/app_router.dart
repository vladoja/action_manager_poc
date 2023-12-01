import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/routes/app_routes.dart';
import '../widgets/scaffold_with_nested_navigation.dart';

final _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'rootNavigatorKey');

final _nkZoznamy = GlobalKey<NavigatorState>(debugLabel: 'nkZoznamy');
final _nkTerminu = GlobalKey<NavigatorState>(debugLabel: 'nkTerminu');
final _nkPracovisko = GlobalKey<NavigatorState>(debugLabel: 'nkPracovisko');
final _nkOsoba = GlobalKey<NavigatorState>(debugLabel: 'nkOsoba');

class AppRouter {
  static final router = GoRouter(
    errorBuilder: (context, state) => Container(color: Colors.red),
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ScaffoldWithNestedNavigation(
          key: const ValueKey('StatefulShellRoute A'),
          navigationShell: navigationShell,
          navDestinations: mainDestinations,
        ),
        branches: <StatefulShellBranch>[],
      )
    ],
  );
}

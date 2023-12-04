import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/routes/app_routes.dart';
import '../utils/router_transition_factory.dart';
import '../widgets/dummy_screen.dart';
import '../widgets/scaffold_with_nested_navigation.dart';

final _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'rootNavigatorKey');

final _nkZoznamy = GlobalKey<NavigatorState>(debugLabel: 'nkZoznamy');
final _nkTerminy = GlobalKey<NavigatorState>(debugLabel: 'nkTerminy');
final _nkPracovisko = GlobalKey<NavigatorState>(debugLabel: 'nkPracovisko');
final _nkOsoba = GlobalKey<NavigatorState>(debugLabel: 'nkOsoba');

final _nkZoznamyOsoby = GlobalKey<NavigatorState>(debugLabel: 'nkZoznamyOsoby');
final _nkZoznamyPracoviska =
    GlobalKey<NavigatorState>(debugLabel: 'nkZoznamyPracoviska');
final _nkZoznamyPersonal =
    GlobalKey<NavigatorState>(debugLabel: 'nkZoznamyPersonal');

class AppRouter {
  static final router = GoRouter(
    errorBuilder: (context, state) => Container(color: Colors.red),
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.navZoznamyOsoby,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ScaffoldWithNestedNavigation(
          key: const ValueKey('StatefulShellRoute Root'),
          navigationShell: navigationShell,
          navDestinations: mainDestinations,
        ),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _nkZoznamy,
            routes: [
              StatefulShellRoute.indexedStack(
                builder: (context, state, navigationShell) =>
                    ScaffoldWithNestedNavigation(
                        key: const ValueKey('StatefulShellRoute Zoznamy'),
                        navigationShell: navigationShell,
                        navDestinations: destinationsZoznamy),
                branches: <StatefulShellBranch>[
                  StatefulShellBranch(
                    navigatorKey: _nkZoznamyOsoby,
                    routes: [
                      GoRoute(
                        path: AppRoutes.navZoznamyOsoby,
                        pageBuilder: (context, state) =>
                            RouterTransitionFactory.getTransitionPage(
                                context: context,
                                state: state,
                                child: const DummyScreen(
                                    label: 'Osoby',
                                    detailsPath:
                                        '${AppRoutes.navZoznamyOsoby}/details'),
                                type: 'scale'),
                        routes: [
                          GoRoute(
                            path: 'details',
                            pageBuilder: (context, state) =>
                                RouterTransitionFactory.getTransitionPage(
                              context: context,
                              state: state,
                              child:
                                  const DetailsScreen(label: 'Osoby Detaily'),
                              type: 'scale', // fade|rotation|scale|size
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    navigatorKey: _nkZoznamyPracoviska,
                    routes: [
                      GoRoute(
                        path: AppRoutes.navZoznamyPracoviska,
                        pageBuilder: (context, state) =>
                            RouterTransitionFactory.getTransitionPage(
                                context: context,
                                state: state,
                                child: const DummyScreen(
                                    label: 'Pracoviská',
                                    detailsPath:
                                        '${AppRoutes.navZoznamyPracoviska}/details'),
                                type: 'scale'),
                        routes: [
                          GoRoute(
                            path: 'details',
                            pageBuilder: (context, state) =>
                                RouterTransitionFactory.getTransitionPage(
                              context: context,
                              state: state,
                              child: const DetailsScreen(
                                  label: 'Pracoviská Detaily'),
                              type: 'scale', // fade|rotation|scale|size
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    navigatorKey: _nkZoznamyPersonal,
                    routes: [
                      GoRoute(
                        path: AppRoutes.navZoznamyPersonal,
                        pageBuilder: (context, state) =>
                            RouterTransitionFactory.getTransitionPage(
                                context: context,
                                state: state,
                                child: const DummyScreen(
                                    label: 'Personál',
                                    detailsPath:
                                        '${AppRoutes.navZoznamyPersonal}/details'),
                                type: 'scale'),
                        routes: [
                          GoRoute(
                            path: 'details',
                            pageBuilder: (context, state) =>
                                RouterTransitionFactory.getTransitionPage(
                              context: context,
                              state: state,
                              child: const DetailsScreen(
                                  label: 'Personál Detaily'),
                              type: 'scale', // fade|rotation|scale|size
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _nkTerminy,
            initialLocation: AppRoutes.navTerminy,
            routes: [
              GoRoute(
                path: AppRoutes.navTerminy,
                pageBuilder: (context, state) =>
                    RouterTransitionFactory.getTransitionPage(
                        context: context,
                        state: state,
                        child: const DummyScreen(
                            label: 'Terminy Osoby',
                            detailsPath: '${AppRoutes.navTerminy}/details'),
                        type: 'scale'),
                routes: [
                  GoRoute(
                    path: 'details',
                    pageBuilder: (context, state) =>
                        RouterTransitionFactory.getTransitionPage(
                      context: context,
                      state: state,
                      child:
                          const DetailsScreen(label: 'Terminy Osoby Detaily'),
                      type: 'scale', // fade|rotation|scale|size
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _nkPracovisko,
            initialLocation: AppRoutes.navPracovisko,
            routes: [
              GoRoute(
                path: AppRoutes.navPracovisko,
                pageBuilder: (context, state) =>
                    RouterTransitionFactory.getTransitionPage(
                        context: context,
                        state: state,
                        child: const DummyScreen(
                            label: 'Pracovisko',
                            detailsPath: '${AppRoutes.navPracovisko}/details'),
                        type: 'scale'),
                routes: [
                  GoRoute(
                    path: 'details',
                    pageBuilder: (context, state) =>
                        RouterTransitionFactory.getTransitionPage(
                      context: context,
                      state: state,
                      child: const DetailsScreen(label: 'Pracovisko Detaily'),
                      type: 'scale', // fade|rotation|scale|size
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _nkOsoba,
            initialLocation: AppRoutes.navOsoba,
            routes: [
              GoRoute(
                path: AppRoutes.navOsoba,
                pageBuilder: (context, state) =>
                    RouterTransitionFactory.getTransitionPage(
                        context: context,
                        state: state,
                        child: const DummyScreen(
                            label: 'Osoby',
                            detailsPath: '${AppRoutes.navOsoba}/details'),
                        type: 'scale'),
                routes: [
                  GoRoute(
                    path: 'details',
                    pageBuilder: (context, state) =>
                        RouterTransitionFactory.getTransitionPage(
                      context: context,
                      state: state,
                      child: const DetailsScreen(label: 'Osoby Detaily'),
                      type: 'scale', // fade|rotation|scale|size
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      )
    ],
  );
}

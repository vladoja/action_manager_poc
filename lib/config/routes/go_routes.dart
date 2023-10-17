import 'package:action_manager_poc/core/widgets/navigation/app_scaffold.dart';
import 'package:action_manager_poc/features/app/domain/entities/action.dart';
import 'package:action_manager_poc/features/app/presentation/pages/akcie/akcie_page.dart';
import 'package:action_manager_poc/features/app/presentation/pages/akcie/edit_action_page.dart';
import 'package:action_manager_poc/features/app/presentation/pages/home/home_page.dart';
import 'package:action_manager_poc/features/app/presentation/pages/personal/personal_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _navPersonalNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'navPersonal');
final _navAkcieNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'navAkcie');
final _navDomovNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'navDomov');
final _rootNavigatorKey = GlobalKey<NavigatorState>();

enum RoutePath {
  root(path: '/'),
  personal(path: '/Personal');

  final String path;
  const RoutePath({required this.path});
}

class AppGoRouter {
  static const navDomov = '/Domov';
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
        redirect: (_, __) => AppGoRouter.navDomov,
        // builder: (context, state) {
        //   return const HomePage();
        // },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppScaffoldShell(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
              initialLocation: AppGoRouter.navDomov,
              navigatorKey: _navDomovNavigatorKey,
              routes: [
                GoRoute(
                  path: AppGoRouter.navDomov,
                  pageBuilder: (context, state) => const NoTransitionPage(
                      child: AppScaffold(body: HomePage())),
                ),
              ]),
          // Nav1 branch
          StatefulShellBranch(
            initialLocation: AppGoRouter.navPersonal,
            navigatorKey: _navPersonalNavigatorKey,
            routes: [
              GoRoute(
                path: AppGoRouter.navPersonal,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: AppScaffold(
                    body: PersonalPage(),
                  ),
                ),
              )
            ],
          ),
          StatefulShellBranch(
            initialLocation: navAkcie,
            navigatorKey: _navAkcieNavigatorKey,
            routes: [
              GoRoute(
                  path: AppGoRouter.navAkcie,
                  pageBuilder: (context, state) => const NoTransitionPage(
                        child: AppScaffold(
                          body: AkciePage(),
                        ),
                      ),
                  routes: [
                    GoRoute(
                      path: ":id",
                      pageBuilder: (context, state) => NoTransitionPage(
                          child: AppScaffold(
                        body: AkciePage(),
                        secondaryBody: EditActionPage(
                          action: (state.extra is ActionEntity)
                              ? state.extra as ActionEntity
                              : null,
                        ),
                      )),
                    )
                  ])
            ],
          ),
        ],
      )
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/routes/app_routes.dart';
import '../../features/app/domain/entities/action.dart';
import '../../features/app/domain/entities/exam/exam_request.dart';
import '../../features/app/domain/entities/oso/oso.dart';
import '../../features/app/domain/entities/osoba/osoba.dart';
import '../../features/app/domain/entities/person/person.dart';
import '../../features/app/presentation/pages/akcie/action_personal_page.dart';
import '../../features/app/presentation/pages/akcie/akcie_page.dart';
import '../../features/app/presentation/pages/akcie/edit_action_page.dart';
import '../../features/app/presentation/pages/oso/oso_create_page.dart';
import '../../features/app/presentation/pages/oso/oso_details_page.dart';
import '../../features/app/presentation/pages/oso/oso_page.dart';
import '../../features/app/presentation/pages/osoby/edit_osoba_page.dart';
import '../../features/app/presentation/pages/osoby/osoba_create_exam_request_page.dart';
import '../../features/app/presentation/pages/osoby/osoby_page.dart';
import '../../features/app/presentation/pages/personal/edit_person_page.dart';
import '../../features/app/presentation/pages/personal/personal_page.dart';
import '../../features/app/presentation/pages/skuska_ziadost/exam_request_preview.dart';
import '../../features/app/presentation/pages/skuska_ziadost/exam_requests_details.dart';
import '../../features/app/presentation/pages/skuska_ziadost/exam_requests_page.dart';
import '../../features/app/presentation/pages/skuska_ziadost/ziadost_o_termin/exam_event_application_new_page.dart';
import '../utils/router_transition_factory.dart';
import '../widgets/adaptive_layout_widget.dart';
import '../widgets/dummy_screen.dart';
import '../widgets/scaffold_with_nested_navigation.dart';

final _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'rootNavigatorKey');

final _nkZoznamy = GlobalKey<NavigatorState>(debugLabel: 'nkZoznamy');
final _nkTerminy = GlobalKey<NavigatorState>(debugLabel: 'nkTerminy');
final _nkPracovisko = GlobalKey<NavigatorState>(debugLabel: 'nkPracovisko');
final _nkOSO = GlobalKey<NavigatorState>(debugLabel: 'nkOSO');

final _nkZoznamyOsoby = GlobalKey<NavigatorState>(debugLabel: 'nkZoznamyOsoby');
final _nkZoznamyPracoviska =
    GlobalKey<NavigatorState>(debugLabel: 'nkZoznamyPracoviska');
final _nkZoznamyPersonal =
    GlobalKey<NavigatorState>(debugLabel: 'nkZoznamyPersonal');
final _nkZoznamyZiadostiOSkusku =
    GlobalKey<NavigatorState>(debugLabel: 'nkZoznamyZiadostiOSkusku');

final _nkTerminyOsoby = GlobalKey<NavigatorState>(debugLabel: 'nkTerminyOsoby');
final _nkTerminyPracoviska =
    GlobalKey<NavigatorState>(debugLabel: 'nkTerminyPracoviska');

final _nkOSOZoznam = GlobalKey<NavigatorState>(debugLabel: 'nkOSOZoznam');

class AppRouter {
  static final router = GoRouter(
    errorBuilder: (context, state) => Container(color: Colors.red),
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.navZoznamyOsoby,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(
            key: const ValueKey('StatefulShellRoute Root'),
            navigationShell: navigationShell,
            navDestinations: mainDestinations,
            showIconsAndTitlesButton: true,
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _nkZoznamy,
            routes: [
              StatefulShellRoute.indexedStack(
                builder: (context, state, navigationShell) =>
                    ScaffoldWithNestedNavigation(
                  key: const ValueKey('StatefulShellRoute Zoznamy'),
                  navigationShell: navigationShell,
                  navDestinations: destinationsZoznamy,
                ),
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
                                child: const OsobyPage(),
                                type: 'scale'),
                        routes: [
                          GoRoute(
                            path: 'Details',
                            redirect: (context, state) {
                              if (state.extra == null) {
                                return AppRoutes.navZoznamyOsoby;
                              } else {
                                return null;
                              }
                            },
                            pageBuilder: (context, state) {
                              final selectedPerson = state.extra as OsobaEntity;
                              return RouterTransitionFactory.getTransitionPage(
                                  context: context,
                                  state: state,
                                  child: AdaptiveLayoutWidget(
                                    body: OsobyPage(
                                        selectedPersonId: selectedPerson.id),
                                    secondaryBody: EditOsobaPage(
                                      person: selectedPerson,
                                    ),
                                    showSecondaryBody: true,
                                    secondaryBodyRatio: 0.6,
                                  ),
                                  type: 'size');
                            },
                          ),
                          GoRoute(
                            path: 'New',
                            pageBuilder: (context, state) =>
                                RouterTransitionFactory.getTransitionPage(
                                    context: context,
                                    state: state,
                                    child: const AdaptiveLayoutWidget(
                                      body: OsobyPage(),
                                      secondaryBody: EditOsobaPage(),
                                      showSecondaryBody: true,
                                    ),
                                    type: 'size'),
                          ),
                          GoRoute(
                              path: 'Edit',
                              redirect: (context, state) {
                                if (state.extra == null) {
                                  return AppRoutes.navZoznamyOsoby;
                                } else {
                                  return null;
                                }
                              },
                              pageBuilder: (context, state) {
                                final selectedPerson =
                                    state.extra as OsobaEntity;
                                return RouterTransitionFactory
                                    .getTransitionPage(
                                        context: context,
                                        state: state,
                                        child: AdaptiveLayoutWidget(
                                          body: EditOsobaPage(
                                            person: selectedPerson,
                                            showGoToEditPageButton: false,
                                          ),
                                          secondaryBody:
                                              OsobaCreateExamRequestPage(
                                            osoba: selectedPerson,
                                          ),
                                          showSecondaryBody: true,
                                        ),
                                        type: 'size');
                              }),
                          GoRoute(
                              path: 'ExamRequest',
                              pageBuilder: (context, state) {
                                final selectedPerson =
                                    state.extra as OsobaEntity;
                                return RouterTransitionFactory
                                    .getTransitionPage(
                                        context: context,
                                        state: state,
                                        child: AdaptiveLayoutWidget(
                                          body: OsobaCreateExamRequestPage(
                                            osoba: selectedPerson,
                                          ),
                                          // secondaryBody: EditOsobaPage(),
                                          showSecondaryBody: true,
                                        ),
                                        type: 'size');
                              }),
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
                                child: const PersonalPage(),
                                type: 'scale'),
                        routes: [
                          GoRoute(
                            path: 'New',
                            // builder: (context, state) => const EditPersonPage(),
                            pageBuilder: (context, state) =>
                                RouterTransitionFactory.getTransitionPage(
                                    context: context,
                                    state: state,
                                    child: const AdaptiveLayoutWidget(
                                      body: PersonalPage(),
                                      secondaryBody: EditPersonPage(),
                                      showSecondaryBody: true,
                                    ),
                                    type: 'size'),
                          ),
                          GoRoute(
                            path: 'Details',
                            // builder: (context, state) => const EditPersonPage(),
                            pageBuilder: (context, state) {
                              final selectedPerson =
                                  state.extra as PersonEntity;
                              return RouterTransitionFactory.getTransitionPage(
                                  context: context,
                                  state: state,
                                  child: AdaptiveLayoutWidget(
                                    body: PersonalPage(
                                        selectedPersonId: selectedPerson.id),
                                    secondaryBody: EditPersonPage(
                                      person: selectedPerson,
                                    ),
                                    showSecondaryBody: true,
                                    secondaryBodyRatio: 0.6,
                                  ),
                                  type: 'size');
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    navigatorKey: _nkZoznamyZiadostiOSkusku,
                    routes: [
                      GoRoute(
                        path: AppRoutes.navZoznamyZiadostiOSkusku,
                        pageBuilder: (context, state) =>
                            RouterTransitionFactory.getTransitionPage(
                                context: context,
                                state: state,
                                child: const ExamRequestsPage(),
                                type: 'scale'),
                        routes: [
                          GoRoute(
                            path: 'Preview',
                            redirect: (context, state) {
                              if (state.extra == null) {
                                return AppRoutes.navZoznamyZiadostiOSkusku;
                              } else {
                                return null;
                              }
                            },
                            // builder: (context, state) => const EditPersonPage(),
                            pageBuilder: (context, state) {
                              final examRequestEntity =
                                  state.extra as ExamRequestEntity;
                              return RouterTransitionFactory.getTransitionPage(
                                  context: context,
                                  state: state,
                                  child: AdaptiveLayoutWidget(
                                    body: ExamRequestsPage(
                                        selectedExamRequestId:
                                            examRequestEntity.id),
                                    secondaryBody: ExamRequestPreview(
                                        examRequest: examRequestEntity),
                                    showSecondaryBody: true,
                                    secondaryBodyRatio: 0.6,
                                  ),
                                  type: 'size');
                            },
                          ),
                          GoRoute(
                            path: 'Details',
                            redirect: (context, state) {
                              if (state.extra == null) {
                                return AppRoutes.navZoznamyZiadostiOSkusku;
                              } else {
                                return null;
                              }
                            },
                            // builder: (context, state) => const EditPersonPage(),
                            pageBuilder: (context, state) {
                              final examRequestEntity =
                                  state.extra as ExamRequestEntity;
                              return RouterTransitionFactory.getTransitionPage(
                                  context: context,
                                  state: state,
                                  child: AdaptiveLayoutWidget(
                                    body: ExamRequestDetailsPage(
                                        examRequest: examRequestEntity),
                                    secondaryBody: ExamEventAppicationNewPage(
                                        examRequest: examRequestEntity),
                                    showSecondaryBody: true,
                                    secondaryBodyRatio: 0.6,
                                  ),
                                  type: 'size');
                            },
                            // routes: [
                            //   GoRoute(
                            //     path: 'NovaZiadost',
                            //     pageBuilder: (context, state) {
                            //       return RouterTransitionFactory
                            //           .getTransitionPage(
                            //               context: context,
                            //               state: state,
                            //               child: AdaptiveLayoutWidget(
                            //                 body: ExamRequestDetailsPage(
                            //                     examRequest: examRequestEntity),
                            //                 showSecondaryBody: true,
                            //                 secondaryBodyRatio: 0.6,
                            //               ),
                            //               type: 'size');
                            //     },
                            //   ),
                            // ],
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
            routes: [
              StatefulShellRoute.indexedStack(
                builder: (context, state, navigationShell) =>
                    ScaffoldWithNestedNavigation(
                        key: const ValueKey('StatefulShellRoute Terminy'),
                        navigationShell: navigationShell,
                        navDestinations: destinationsTerminy),
                branches: <StatefulShellBranch>[
                  StatefulShellBranch(
                    navigatorKey: _nkTerminyOsoby,
                    routes: [
                      GoRoute(
                        path: AppRoutes.navTerminyOsoby,
                        pageBuilder: (context, state) => const NoTransitionPage(
                          child: AdaptiveLayoutWidget(
                            body: AkciePage(),
                          ),
                        ),
                        routes: [
                          GoRoute(
                            path: 'New',
                            pageBuilder: (context, state) =>
                                RouterTransitionFactory.getTransitionPage(
                                    context: context,
                                    state: state,
                                    child: const AdaptiveLayoutWidget(
                                      body: AkciePage(),
                                      secondaryBody: EditActionPage(),
                                      showSecondaryBody: true,
                                      secondaryBodyRatio: 0.7,
                                    ),
                                    type: 'size'),
                          ),
                          GoRoute(
                            path: 'Details',
                            redirect: (context, state) {
                              if (state.extra == null) {
                                return AppRoutes.navTerminyOsoby;
                              } else {
                                return null;
                              }
                            },
                            pageBuilder: (context, state) {
                              final selectedAction =
                                  state.extra as ActionEntity;
                              return RouterTransitionFactory.getTransitionPage(
                                  context: context,
                                  state: state,
                                  child: AdaptiveLayoutWidget(
                                    body: AkciePage(
                                        selectedActionId: selectedAction.id),
                                    secondaryBody:
                                        EditActionPage(action: selectedAction),
                                    showSecondaryBody: true,
                                    secondaryBodyRatio: 0.7,
                                  ),
                                  type: 'size');
                            },
                          ),
                          GoRoute(
                            path: 'Edit',
                            redirect: (context, state) {
                              if (state.extra == null) {
                                return AppRoutes.navTerminyOsoby;
                              } else {
                                return null;
                              }
                            },
                            pageBuilder: (context, state) {
                              final selectedAction =
                                  state.extra as ActionEntity;
                              return RouterTransitionFactory.getTransitionPage(
                                  context: context,
                                  state: state,
                                  child: AdaptiveLayoutWidget(
                                    body: EditActionPage(
                                      action: selectedAction,
                                      showGoToEditPageButton: false,
                                    ),
                                    secondaryBody: ActionPersonalPage(
                                        actionId: selectedAction.id),
                                    showSecondaryBody: true,
                                  ),
                                  type: 'size');
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    navigatorKey: _nkTerminyPracoviska,
                    routes: [
                      GoRoute(
                        path: AppRoutes.navTerminyPracoviska,
                        pageBuilder: (context, state) => const NoTransitionPage(
                          child: SimpleScreen(label: 'Not Implemented Yet'),
                        ),
                      ),
                    ],
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
            navigatorKey: _nkOSO,
            // initialLocation: AppRoutes.navOsoba,
            routes: [
              StatefulShellRoute.indexedStack(
                  builder: (context, state, navigationShell) =>
                      ScaffoldWithNestedNavigation(
                          key: const ValueKey('StatefulShellRoute Oso'),
                          navigationShell: navigationShell,
                          navDestinations: destinationsOSO),
                  branches: <StatefulShellBranch>[
                    StatefulShellBranch(
                      navigatorKey: _nkOSOZoznam,
                      routes: [
                        GoRoute(
                          path: AppRoutes.navOSOZoznam,
                          pageBuilder: (context, state) =>
                              RouterTransitionFactory.getTransitionPage(
                                  context: context,
                                  state: state,
                                  child: const OSOPage(),
                                  type: 'scale'),
                          routes: [
                            GoRoute(
                              path: 'New',
                              pageBuilder: (context, state) =>
                                  RouterTransitionFactory.getTransitionPage(
                                      context: context,
                                      state: state,
                                      child: const AdaptiveLayoutWidget(
                                        body: OSOPage(),
                                        secondaryBody: OsoCreatePage(),
                                        showSecondaryBody: true,
                                      ),
                                      type: 'size'),
                            ),
                            GoRoute(
                              path: 'Details',
                              redirect: (context, state) {
                                if (state.extra == null) {
                                  return AppRoutes.navOSOZoznam;
                                } else {
                                  return null;
                                }
                              },
                              pageBuilder: (context, state) {
                                final selectedOso = state.extra as OsoEntity;
                                return RouterTransitionFactory
                                    .getTransitionPage(
                                        context: context,
                                        state: state,
                                        child: AdaptiveLayoutWidget(
                                          body: OSOPage(
                                              selectedOSOid: selectedOso.id),
                                          secondaryBody:
                                              OsoDetailsPage(oso: selectedOso),
                                          showSecondaryBody: true,
                                        ),
                                        type: 'size');
                              },
                            ),
                          ],
                        ),
                      ],
                    )
                  ])
            ],
          ),
        ],
      )
    ],
  );
}

import 'package:action_manager_poc/core/navigation/nav_destionation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class AppScaffoldShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppScaffoldShell({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      useDrawer: false,
      selectedIndex: navigationShell.currentIndex,
      onSelectedIndexChange: onNavigationEvent,
      destinations: NavDestination.values
          .map(
            (e) => NavigationDestination(
              icon: Icon(e.icon),
              label: e.label,
            ),
          )
          .toList(),
      body: (_) => navigationShell,
    );
  }

  void onNavigationEvent(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/navigation_converter_extension.dart';
import 'scaffold_with_navigation_bar.dart';
import 'scaffold_with_navigation_rail.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
    required this.navDestinations,
  }) : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;
  final List<NavigationDestination> navDestinations;

  void _goBranch(int index) {
    debugPrint(
        'goBranch: $index, Route branches total: ${(navigationShell.route.branches.isEmpty) ? "NEEXISTUJE" : navigationShell.route.branches.length}');

    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final double height = size.height;
    final double width = size.width;
    if (width < 450) {
      return ScaffoldWithNavigationBar(
          body: navigationShell,
          navDestinations: navDestinations,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch);
    } else {
      return ScaffoldWithNavigationRail(
          extended: true,
          body: navigationShell,
          navDestinations:
              navDestinations.map((e) => e.convertToRail()).toList(),
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch);
    }
  }
}

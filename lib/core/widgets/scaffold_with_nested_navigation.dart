import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../config/constants.dart';
import '../../features/app/presentation/bloc/settings/settings_bloc.dart';
import '../utils/navigation_converter_extension.dart';
import 'scaffold_with_navigation_bar.dart';
import 'scaffold_with_navigation_rail.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
    required this.navDestinations,
    this.showIconsAndTitlesButton = false,
  }) : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;
  final List<NavigationDestination> navDestinations;
  final bool showIconsAndTitlesButton;

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
    bool showTitlesInMainRail =
        context.watch<SettingsBloc>().state.showTitlesInMainRail;
    final double width = size.width;
    if (width < kNavigationBarToRailWidth) {
      return ScaffoldWithNavigationBar(
          body: navigationShell,
          navDestinations: navDestinations,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch);
    } else {
      return ScaffoldWithNavigationRail(
          extended: showTitlesInMainRail,
          showIconsAndTitlesButton: showIconsAndTitlesButton,
          body: navigationShell,
          navDestinations:
              navDestinations.map((e) => e.convertToRail()).toList(),
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch);
    }
  }
}

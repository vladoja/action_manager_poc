import 'package:flutter/material.dart';

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail(
      {super.key,
      required this.body,
      required this.navDestinations,
      required this.selectedIndex,
      required this.onDestinationSelected,
      required this.extended});
  final Widget body;
  final List<NavigationRailDestination> navDestinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final bool extended;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 200),
            child: NavigationRail(
              destinations: navDestinations,
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
              extended: extended,
            ),
          ),
          const VerticalDivider(
            thickness: 1,
            width: 1,
          ),
          // This is the main content.
          Expanded(
            child: body,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar(
      {super.key,
      required this.body,
      required this.selectedIndex,
      required this.onDestinationSelected,
      required this.navDestinations});

  final Widget body;
  final List<NavigationDestination> navDestinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: navDestinations,
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}

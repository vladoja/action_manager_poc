import 'package:flutter/material.dart';

enum NavDestination {
  nav0(
    "Domov",
    Icons.home,
  ),
  nav1(
    "Personal",
    Icons.group,
  ),
  nav2(
    "Akcie",
    Icons.edit_document,
  );

  final String label;
  final IconData icon;
  const NavDestination(
    this.label,
    this.icon,
  );
}

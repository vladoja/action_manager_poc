import 'package:flutter/material.dart';

enum NavDestination {
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

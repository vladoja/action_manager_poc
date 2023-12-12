import 'package:flutter/material.dart';

extension ConvertToRail on NavigationDestination {
  NavigationRailDestination convertToRail({double maxWidth = 120}) {
    return NavigationRailDestination(
        icon: icon,
        label: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 120),
          child: Tooltip(
              message: label,
              child: Text(label, maxLines: 2, overflow: TextOverflow.ellipsis)),
        ),
        selectedIcon: selectedIcon);
  }
}

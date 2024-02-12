import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/constants.dart';
import '../../features/app/presentation/bloc/settings/settings_bloc.dart';

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
    super.key,
    required this.body,
    required this.navDestinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.extended,
    this.showIconsAndTitlesButton = false,
  });
  final Widget body;
  final List<NavigationRailDestination> navDestinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final bool extended;
  final bool showIconsAndTitlesButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ConstrainedBox(
            constraints: (extended == true)
                ? const BoxConstraints(maxWidth: kNavigationRailExtendedWidth)
                : const BoxConstraints(maxWidth: kNavigationRailIconsOnlyWidth),
            child: NavigationRail(
              destinations: navDestinations,
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
              extended: extended,
              trailing: showIconsAndTitlesButton
                  ? Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: kNavigationRailIconsOnlyWidth),
                        width: kNavigationRailIconsOnlyWidth,
                        child: IconButton(
                          icon:
                              const Icon(Icons.swap_horizontal_circle_outlined),
                          onPressed: () {
                            _handleShowTitlesInMainRail(context);
                          },
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
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

  void _handleShowTitlesInMainRail(BuildContext context) {
    context.read<SettingsBloc>().add(SwitchShowTitlesInMainRailEvent());
  }
}

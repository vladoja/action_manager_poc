import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class AdaptiveLayoutWidget extends StatelessWidget {
  final bool showSecondaryBody;
  final Widget body;
  final Widget? secondaryBody;
  final Widget? topNavigation;
  final double secondaryBodyRatio;
  const AdaptiveLayoutWidget({
    super.key,
    required this.body,
    this.secondaryBody,
    this.topNavigation,
    this.showSecondaryBody = false,
    this.secondaryBodyRatio = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      bodyRatio: (secondaryBody == null) ? 1 : secondaryBodyRatio,
      body: SlotLayout(
        config: {
          Breakpoints.small: SlotLayout.from(
            key: const Key('Body small'),
            builder: (_) => body,
          ),
          Breakpoints.mediumAndUp: SlotLayout.from(
            key: const Key('Body Medium'),
            builder: (_) => body,
          )
        },
      ),
      secondaryBody: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.mediumAndUp: SlotLayout.from(
              key: const Key('Body medium'),
              builder: (secondaryBody != null && showSecondaryBody)
                  ? (_) => secondaryBody!
                  : AdaptiveScaffold.emptyBuilder)
        },
      ),
      topNavigation: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
        Breakpoints.medium: SlotLayout.from(
            key: const Key('Body medium'),
            builder: topNavigation != null
                ? (_) => topNavigation!
                : AdaptiveScaffold.emptyBuilder)
      }),
    );
  }
}

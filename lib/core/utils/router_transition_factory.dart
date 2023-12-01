import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterTransitionFactory {
  /// type -  fade|rotation|scale|size
  static CustomTransitionPage getTransitionPage(
      {required BuildContext context,
      required GoRouterState state,
      required Widget child,
      required String type,
      Duration transitionDuration = const Duration(milliseconds: 300)}) {
    return CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: transitionDuration,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          switch (type) {
            case 'fade':
              return FadeTransition(opacity: animation, child: child);
            case 'rotation':
              return RotationTransition(turns: animation, child: child);
            case 'size':
              return SizeTransition(sizeFactor: animation, child: child);
            case 'scale':
              return ScaleTransition(scale: animation, child: child);
            default:
              return FadeTransition(opacity: animation, child: child);
          }
        });
  }
}

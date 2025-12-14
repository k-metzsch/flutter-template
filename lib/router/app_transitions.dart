import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

enum TransitionType {
  rightToLeft,
  leftToRight,
  bottomToTop,
  topToBottom,
  fade,
  none,
}

abstract class AppTransitions {
  static CustomTransitionPage<T> buildTransition<T>({
    required Widget child,
    required GoRouterState state,
    TransitionType type = TransitionType.rightToLeft,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionDuration: duration,
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return _buildTransitionWidget(animation, child, type);
      },
    );
  }

  static Widget _buildTransitionWidget(
    Animation<double> animation,
    Widget child,
    TransitionType type,
  ) {
    switch (type) {
      case TransitionType.rightToLeft:
        return _slideTransition(animation, child, const Offset(1, 0));
      case TransitionType.leftToRight:
        return _slideTransition(animation, child, const Offset(-1, 0));
      case TransitionType.bottomToTop:
        return _slideTransition(animation, child, const Offset(0, 1));
      case TransitionType.topToBottom:
        return _slideTransition(animation, child, const Offset(0, -1));
      case TransitionType.fade:
        return FadeTransition(opacity: animation, child: child);
      case TransitionType.none:
        return child;
    }
  }

  static SlideTransition _slideTransition(
    Animation<double> animation,
    Widget child,
    Offset begin,
  ) {
    const Offset end = Offset.zero;
    const Curve curve = Curves.ease;

    final Animatable<Offset> tween = Tween<Offset>(
      begin: begin,
      end: end,
    ).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}

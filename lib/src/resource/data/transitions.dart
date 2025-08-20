import 'package:flutter/widgets.dart';

class TransitionsData {
  TransitionsData(
    this.context,
    this.animation,
    this.secondaryAnimation,
    this.child,
  );

  final BuildContext context;
  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final Widget child;

  Widget slideTransition(Option? option) => switch (option) {
    null => _slideTransition(const Offset(1, 0)),
    Option.leftToRight => _slideTransition(const Offset(-1, 0)),
    Option.bottomToTop => _slideTransition(const Offset(0, 1)),
    Option.topToBottom => _slideTransition(const Offset(0, -1)),
  };

  SlideTransition _slideTransition(Offset begin) {
    const Offset end = Offset.zero;
    const Curve curve = Curves.ease;

    final Animatable<Offset> tween = Tween<Offset>(begin: begin, end: end).chain(CurveTween(curve: curve));
    return SlideTransition(position: animation.drive(tween), child: child);
  }
}

enum Option {
  leftToRight,
  bottomToTop,
  topToBottom,
}

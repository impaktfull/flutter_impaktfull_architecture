import 'package:flutter/material.dart';

class FadeInRoute<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;
  final Curve curve;
  final Duration duration;

  FadeInRoute({
    required this.builder,
    super.settings,
    super.fullscreenDialog,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionDuration: duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

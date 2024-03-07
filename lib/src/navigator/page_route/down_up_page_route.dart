import 'package:flutter/material.dart';

class DownUpPageRoute<T> extends PageRouteBuilder<T> {
  WidgetBuilder builder;
  DownUpPageRoute({
    required this.builder,
    super.settings,
    super.fullscreenDialog,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              builder(context),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

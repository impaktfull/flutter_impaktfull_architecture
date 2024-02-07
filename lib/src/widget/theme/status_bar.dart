import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBar extends StatelessWidget {
  final Widget child;
  final bool isDark;

  const StatusBar.isDark({
    required this.child,
    super.key,
  }) : isDark = true;

  const StatusBar.light({
    required this.child,
    super.key,
  }) : isDark = false;

  const StatusBar.custom({
    required this.child,
    required this.isDark,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark
          ? SystemUiOverlayStyle.light
              .copyWith(systemNavigationBarColor: Colors.transparent)
          : SystemUiOverlayStyle.dark
              .copyWith(systemNavigationBarColor: Colors.transparent),
      child: child,
    );
  }
}

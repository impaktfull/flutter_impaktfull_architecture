import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBar extends StatelessWidget {
  final Widget child;
  final bool dark;

  const StatusBar.dark({
    required this.child,
    super.key,
  }) : dark = true;

  const StatusBar.light({
    required this.child,
    super.key,
  }) : dark = false;

  const StatusBar.custom({
    required this.child,
    required this.dark,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: dark ? Colors.white : Colors.black,
        statusBarBrightness: dark ? Brightness.light : Brightness.dark,
        statusBarIconBrightness: dark ? Brightness.dark : Brightness.light,
        systemNavigationBarIconBrightness:
            dark ? Brightness.dark : Brightness.light,
      ),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBar extends StatelessWidget {
  final Widget child;
  final bool light;

  const StatusBar({
    required this.child,
    this.light = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: light ? Colors.white : Colors.black,
        statusBarBrightness: light ? Brightness.light : Brightness.dark,
        statusBarIconBrightness: light ? Brightness.dark : Brightness.light,
        systemNavigationBarIconBrightness:
            light ? Brightness.dark : Brightness.light,
      ),
      child: child,
    );
  }
}

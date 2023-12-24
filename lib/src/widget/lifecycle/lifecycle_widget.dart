import 'package:flutter/material.dart';

/// Widget that handles lifecycle changes based on the [WidgetsBindingObserver]
/// And mapping the [AppLifecycleState] to a correct callback.
class LifecycleWidget extends StatefulWidget {
  /// The widget below this widget in the tree.
  final Widget child;

  /// [onResumed] is triggered when the app goes to the [AppLifecycleState.resumed] state.
  final VoidCallback? onResumed;

  /// [onPaused] is triggered when the app goes to the [AppLifecycleState.paused] state.
  final VoidCallback? onPaused;

  /// [onInactive] is triggered when the app goes to the [AppLifecycleState.inactive] state.
  final VoidCallback? onInactive;

  /// [onHidden] is triggered when the app goes to the [AppLifecycleState.hidden] state.
  final VoidCallback? onHidden;

  /// [onDetached] is triggered when the app goes to the [AppLifecycleState.detached] state.
  final VoidCallback? onDetached;

  /// Widget that handles lifecycle changes based on the [WidgetsBindingObserver]
  /// And mapping the [AppLifecycleState] to a correct callback.
  const LifecycleWidget({
    required this.child,
    this.onResumed,
    this.onPaused,
    this.onInactive,
    this.onHidden,
    this.onDetached,
    super.key,
  });

  @override
  State<LifecycleWidget> createState() => _LifecycleWidgetState();
}

class _LifecycleWidgetState extends State<LifecycleWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        widget.onResumed?.call();
        break;
      case AppLifecycleState.paused:
        widget.onPaused?.call();
        break;
      case AppLifecycleState.inactive:
        widget.onInactive?.call();
        break;
      case AppLifecycleState.hidden:
        widget.onHidden?.call();
        break;
      case AppLifecycleState.detached:
        widget.onDetached?.call();
        break;
    }
  }
}

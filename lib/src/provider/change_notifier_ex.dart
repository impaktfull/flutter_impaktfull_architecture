import 'package:flutter/foundation.dart';

abstract class ChangeNotifierEx extends ChangeNotifier {
  bool _diposed = false;

  bool get disposed => _diposed;

  @override
  void dispose() {
    super.dispose();
    _diposed = true;
  }
}

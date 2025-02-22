import 'package:flutter/foundation.dart';

class PlatformUtil {
  const PlatformUtil._();

  static bool isAndroid() => false;

  static bool isIOS() => false;

  static bool isMacOs() => false;

  static bool isWindows() => false;

  static bool isLinux() => false;

  static bool isWeb() => kIsWeb;
}

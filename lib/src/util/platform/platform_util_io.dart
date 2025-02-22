import 'dart:io';

import 'package:flutter/foundation.dart';

class PlatformUtil {
  const PlatformUtil._();

  static bool isAndroid() => Platform.isAndroid;

  static bool isIOS() => Platform.isIOS;

  static bool isMacOs() => Platform.isMacOS;

  static bool isWindows() => Platform.isWindows;

  static bool isLinux() => Platform.isLinux;

  static bool isWeb() => kIsWeb;
}

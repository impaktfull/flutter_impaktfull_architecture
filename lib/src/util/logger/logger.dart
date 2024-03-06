import 'package:flutter/foundation.dart';

class ImpaktfullLogger {
  const ImpaktfullLogger._();

  static void log(Object message) {
    if (kDebugMode) print(message);
  }

  static void logError(String message, {Object? error, StackTrace? trace}) {
    log(message);
    if (error != null) {
      log(error);
    }
    if (trace != null) {
      log(trace);
    }
  }

  static void logFullError(
    String message, {
    required Object? error,
    required StackTrace? trace,
  }) =>
      logError(message, error: error, trace: trace);

  static void verbose(Object message) => log(message);

  static void debug(Object message) => log(message);
}

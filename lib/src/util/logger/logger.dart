import 'package:flutter/foundation.dart';

class ImpaktfullLogger {
  static final _listeners = <ImpaktfulLoggerListener>{};
  static var _logLevel = ImpaktfullLogType.verbose;

  const ImpaktfullLogger._();

  static void setLogLevel(ImpaktfullLogType logLevel) {
    _logLevel = logLevel;
  }

  static void attachListener(ImpaktfulLoggerListener listener) =>
      _listeners.add(listener);

  static void removeListener(ImpaktfulLoggerListener listener) =>
      _listeners.remove(listener);

  static void _log(ImpaktfullLogType type, Object message) {
    final stringMessage = message.toString();
    if (_logLevel.priority <= type.priority) return;
    if (kDebugMode) {
      print(stringMessage);
    }
  }

  static void logWarning(Object message) {
    _log(ImpaktfullLogType.warning, message);
  }

  static void logError(
    String message, {
    Object? error,
    StackTrace? trace,
    bool report = false,
  }) {
    final sb = StringBuffer();
    sb.writeln(message);
    if (error != null) {
      sb.writeln(error.toString());
    }
    if (trace != null) {
      sb.writeln(trace.toString());
    }
    _log(ImpaktfullLogType.error, sb.toString());
    if (report) {
      for (final listener in _listeners) {
        listener.reportError(message, error: error, trace: trace);
      }
    }
  }

  static void reportError(
    String message, {
    required Object? error,
    required StackTrace? trace,
  }) =>
      logError(message, error: error, trace: trace, report: true);

  static void verbose(Object message) =>
      _log(ImpaktfullLogType.verbose, message);

  static void debug(Object message) => _log(ImpaktfullLogType.debug, message);

  static void info(Object message) => _log(ImpaktfullLogType.info, message);

  static void logBreadcrumb(String message) {
    _log(ImpaktfullLogType.debug, message);
    for (final listener in _listeners) {
      listener.logBreadrumb(message);
    }
  }
}

enum ImpaktfullLogType {
  error(0),
  warning(1),
  debug(2),
  info(3),
  verbose(4);

  final int priority;
  const ImpaktfullLogType(this.priority);
}

abstract class ImpaktfulLoggerListener {
  void log(ImpaktfullLogType type, String message) {}

  void logBreadrumb(String message) {}

  void reportError(
    String message, {
    required Object? error,
    required StackTrace? trace,
  }) {}
}

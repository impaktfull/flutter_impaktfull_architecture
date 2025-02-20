abstract class ImpaktfullCrashReportingUtil {
  Future<void> init();

  Future<void> setEnabled(bool enabled);

  void setUserId(String userId);

  void setUserProperty({
    required String property,
    required String value,
  });

  void log(String message, {Map<String, dynamic>? data});

  void logError({
    required Object error,
    required StackTrace stackTrace,
    String? message,
  });

  void logUnhandledError({
    required Object error,
    required StackTrace stackTrace,
  });
}

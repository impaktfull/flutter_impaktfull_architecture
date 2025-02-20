abstract class ImpaktfullCrashReportingUtil {
  Future<void> init({bool enabled = false});

  Future<void> setEnabled(bool enabled);

  void setUserId(String userId);

  void setUserProperty(String property, String value);

  void logError({
    required Object error,
    required StackTrace stackTrace,
    String? message,
  });

  void log(String message, {Map<String, dynamic>? data});
}

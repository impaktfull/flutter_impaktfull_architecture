import 'package:impaktfull_architecture/src/util/crash_reporting/crash_reporting_util.dart';

class MultiInstanceCrashReportingUtil extends ImpaktfullCrashReportingUtil {
  final List<ImpaktfullCrashReportingUtil> crashReportingUtils;

  MultiInstanceCrashReportingUtil(
    this.crashReportingUtils,
  );

  @override
  Future<void> init({bool enabled = false}) async {
    await Future.wait(
      crashReportingUtils.map(
        (util) => util.init(
          enabled: enabled,
        ),
      ),
    );
  }

  @override
  Future<void> setEnabled(bool enabled) async {
    await Future.wait(
      crashReportingUtils.map(
        (util) => util.setEnabled(enabled),
      ),
    );
  }

  @override
  void setUserId(String userId) {
    for (final util in crashReportingUtils) {
      util.setUserId(userId);
    }
  }

  @override
  void setUserProperty(String property, String value) {
    for (final util in crashReportingUtils) {
      util.setUserProperty(property, value);
    }
  }

  @override
  void log(String message, {Map<String, dynamic>? data}) {
    for (final util in crashReportingUtils) {
      util.log(message, data: data);
    }
  }

  @override
  void logError({
    required Object error,
    required StackTrace stackTrace,
    String? message,
  }) {
    for (final util in crashReportingUtils) {
      util.logError(error: error, stackTrace: stackTrace, message: message);
    }
  }

  @override
  void logUnhandledError(Object error, StackTrace stackTrace) {
    for (final util in crashReportingUtils) {
      util.logUnhandledError(error, stackTrace);
    }
  }
}

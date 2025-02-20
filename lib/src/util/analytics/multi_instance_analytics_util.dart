import 'package:impaktfull_architecture/src/util/analytics/analytics_util.dart';

class MultiInstanceAnalyticsUtil extends ImpaktfullAnalyticsUtil {
  final List<ImpaktfullAnalyticsUtil> analyticsUtils;

  MultiInstanceAnalyticsUtil(
    this.analyticsUtils,
  );

  @override
  Future<void> init({bool enabled = false}) async {
    await Future.wait(analyticsUtils.map(
      (util) => util.init(
        enabled: enabled,
      ),
    ));
  }

  @override
  Future<void> setEnabled(bool enabled) async {
    await Future.wait(analyticsUtils.map(
      (util) => util.setEnabled(enabled),
    ));
  }

  @override
  void setUserId(String userId) {
    for (var util in analyticsUtils) {
      util.setUserId(userId);
    }
  }

  @override
  void setUserProperty(String property, String value) {
    for (var util in analyticsUtils) {
      util.setUserProperty(property, value);
    }
  }

  @override
  void logEvent(String eventName, {Map<String, dynamic>? data}) {
    for (var util in analyticsUtils) {
      util.logEvent(eventName, data: data);
    }
  }

  @override
  void setScreenName(String screenName) {
    for (var util in analyticsUtils) {
      util.setScreenName(screenName);
    }
  }
}

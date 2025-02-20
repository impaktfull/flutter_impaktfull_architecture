abstract class ImpaktfullAnalyticsUtil {
  Future<void> init();

  Future<void> setEnabled(bool enabled);

  void logEvent(String eventName, {Map<String, dynamic>? data});

  void setUserProperty(String property, String value);

  void setUserId(String userId);

  void setScreenName(String screenName);
}

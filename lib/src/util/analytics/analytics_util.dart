abstract class ImpaktfullAnalyticsUtil {
  Future<void> init();

  Future<void> setEnabled(bool enabled);

  void setUserId(String userId);

  void setUserProperty({
    required String property,
    required String value,
  });

  void logEvent(String eventName, {Map<String, dynamic>? data});

  void setScreenName(String screenName);
}

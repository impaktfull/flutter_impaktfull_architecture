import 'package:app_settings/app_settings.dart' as app_settings;

class AppSettings {
  static Future<void> openAccessibilitySettings({
    bool asAnotherTask = false,
  }) async =>
      await app_settings.AppSettings.openAppSettings(
        type: app_settings.AppSettingsType.accessibility,
        asAnotherTask: asAnotherTask,
      );

  static Future<void> openAppSettings({
    bool asAnotherTask = false,
  }) async =>
      await app_settings.AppSettings.openAppSettings(
        type: app_settings.AppSettingsType.settings,
        asAnotherTask: asAnotherTask,
      );

  static Future<void> openBatteryOptimizationSettings({
    bool asAnotherTask = false,
  }) async =>
      await app_settings.AppSettings.openAppSettings(
        type: app_settings.AppSettingsType.batteryOptimization,
        asAnotherTask: asAnotherTask,
      );

  static Future<void> openBluetoothSettings({
    bool asAnotherTask = false,
  }) async =>
      await app_settings.AppSettings.openAppSettings(
        type: app_settings.AppSettingsType.bluetooth,
        asAnotherTask: asAnotherTask,
      );

  static Future<void> openHotspotSettings({
    bool asAnotherTask = false,
  }) async =>
      await app_settings.AppSettings.openAppSettings(
        type: app_settings.AppSettingsType.hotspot,
        asAnotherTask: asAnotherTask,
      );

  static Future<void> openLocationSettings({
    bool asAnotherTask = false,
  }) async =>
      await app_settings.AppSettings.openAppSettings(
        type: app_settings.AppSettingsType.location,
        asAnotherTask: asAnotherTask,
      );

  static Future<void> openNotificationSettings({
    bool asAnotherTask = false,
  }) async =>
      await app_settings.AppSettings.openAppSettings(
        type: app_settings.AppSettingsType.notification,
        asAnotherTask: asAnotherTask,
      );

  static Future<void> openWifiSettings({
    bool asAnotherTask = false,
  }) async =>
      await app_settings.AppSettings.openAppSettings(
        type: app_settings.AppSettingsType.wifi,
        asAnotherTask: asAnotherTask,
      );

  // static Android Setting Panels

  static Future<void> openWifiSettingsPannel() async =>
      await app_settings.AppSettings.openAppSettingsPanel(
        app_settings.AppSettingsPanelType.wifi,
      );

  static Future<void> openInternetConnectivitySettingsPannel() async =>
      await app_settings.AppSettings.openAppSettingsPanel(
        app_settings.AppSettingsPanelType.internetConnectivity,
      );

  static Future<void> openNfcSettingsPannel() async =>
      await app_settings.AppSettings.openAppSettingsPanel(
        app_settings.AppSettingsPanelType.nfc,
      );

  static Future<void> openVolumeSettingsPannel() async =>
      await app_settings.AppSettings.openAppSettingsPanel(
        app_settings.AppSettingsPanelType.volume,
      );
}

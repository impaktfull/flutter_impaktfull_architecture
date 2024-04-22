abstract class ImpaktfullRemoteConfigData {
  static late ImpaktfullRemoteConfigData _remoteConfigData;

  static ImpaktfullRemoteConfigData get baseRemoteConfigData =>
      _remoteConfigData;

  static void configure(ImpaktfullRemoteConfigData remoteConfigData) =>
      _remoteConfigData = remoteConfigData;

  final int latestVersionCode;
  final int minVersionCode;
  final String updateUrl;

  const ImpaktfullRemoteConfigData({
    required this.latestVersionCode,
    required this.minVersionCode,
    required this.updateUrl,
  });
}

class VersionCheckResult {
  final String? updateUrl;
  final bool isForceUpdate;
  final String versionNumber;

  VersionCheckResult({
    required this.updateUrl,
    required this.isForceUpdate,
    required this.versionNumber,
  });
}

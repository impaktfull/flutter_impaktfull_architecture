import 'dart:async';

import 'package:impaktfull_architecture/src/model/data/version_check/version_check_result.dart';
import 'package:impaktfull_architecture/src/model/data/version_check/version_requirements.dart';
import 'package:impaktfull_architecture/src/service/version_check/version_check_service.dart';
import 'package:package_info_plus/package_info_plus.dart';

abstract class VersionCheckRepository {
  factory VersionCheckRepository(
    VersionCheckService versionCheckService,
  ) = _VersionCheckRepository;

  Future<String> getAppVersion();

  Future<VersionCheckResult?> checkVersionCheck();
}

class _VersionCheckRepository implements VersionCheckRepository {
  final VersionCheckService _versionCheckService;

  _VersionCheckRepository(
    this._versionCheckService,
  );

  @override
  Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return '${packageInfo.version} (${packageInfo.buildNumber})';
  }

  @override
  Future<VersionCheckResult?> checkVersionCheck() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final versionRequirement =
        await _versionCheckService.getVersionRequirements();
    if (versionRequirement == null) return null;
    final currentBuildNumber = int.tryParse(packageInfo.buildNumber) ?? 0;
    final latest = versionRequirement.latest;
    final min = versionRequirement.min;
    if (min != null) {
      final result = _getVersionCheckResult(min, currentBuildNumber, true);
      if (result != null) return result;
    }
    return _getVersionCheckResult(latest, currentBuildNumber, false);
  }

  VersionCheckResult? _getVersionCheckResult(
    VersionRequirement versionRequirement,
    int currentBuildNumber,
    bool isForcedUpdate,
  ) {
    if (currentBuildNumber >= versionRequirement.buildNumber) return null;
    final versionNumber = versionRequirement.versionNumber ??
        versionRequirement.buildNumber.toString();
    return VersionCheckResult(
      updateUrl: versionRequirement.updateUrl,
      isForceUpdate: isForcedUpdate,
      versionNumber: versionNumber,
    );
  }
}

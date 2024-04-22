import 'package:impaktfull_architecture/src/model/data/version_check/version_check_result.dart';
import 'package:impaktfull_architecture/src/model/data/version_check/version_requirements.dart';
import 'package:impaktfull_architecture/src/service/version_check/version_check_service.dart';

class NoopVersionCheckService extends VersionCheckService {
  @override
  Future<VersionRequirements?> getVersionRequirements() async => null;

  @override
  Future<void> install(VersionCheckResult result) async {}

  @override
  void openStore() {}
}

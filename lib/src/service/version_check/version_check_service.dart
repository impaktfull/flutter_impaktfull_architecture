import 'package:impaktfull_architecture/src/model/data/version_check/version_check_result.dart';
import 'package:impaktfull_architecture/src/model/data/version_check/version_requirements.dart';

abstract class VersionCheckService {
  Future<VersionRequirements?> getVersionRequirements();

  Future<void> install(VersionCheckResult result);

  void openStore();
}

import 'package:impaktfull_architecture/src/model/data/version_check/version_check_result.dart';
import 'package:impaktfull_architecture/src/model/data/version_check/version_requirements.dart';

abstract class ImpaktfullVersionCheckService {
  Future<ImpaktfullVersionRequirements?> getVersionRequirements();

  Future<void> install(ImpaktfullVersionCheckResult result);

  void openStore();
}

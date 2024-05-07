import 'package:impaktfull_architecture/src/model/data/version_check/version_check_result.dart';
import 'package:impaktfull_architecture/src/model/data/version_check/version_requirements.dart';
import 'package:impaktfull_architecture/src/service/version_check/version_check_service.dart';

class ImpaktfullNoopVersionCheckService extends ImpaktfullVersionCheckService {
  @override
  Future<ImpaktfullVersionRequirements?> getVersionRequirements() async => null;

  @override
  Future<void> install(ImpaktfullVersionCheckResult result) async {}

  @override
  void openStore() {}
}

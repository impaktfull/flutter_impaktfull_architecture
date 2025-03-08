import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:impaktfull_architecture/src/repo/version_check/version_check_repository.dart';
import 'package:impaktfull_architecture/src/util/connectivity/connectivity.dart';
import 'package:impaktfull_architecture/src/util/keychain_cleanup/keychain_cleanup_util.dart';
import 'package:impaktfull_architecture/src/util/storage/key_value/key_value_store.dart';
import 'package:impaktfull_architecture/src/util/storage/secure/secure_store.dart';
import 'package:impaktfull_architecture/src/util/storage/shared_prefs/shared_prefs_store.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> configureImpaktfullArchitecture(
  GetItHelper gh, {
  bool isWeb = kIsWeb,
}) async {
  await _register3rdPartyStorage(gh, isWeb: isWeb);
  _registerStores(gh, isWeb: isWeb);
}

Future<void> _register3rdPartyStorage(
  GetItHelper gh, {
  required bool isWeb,
}) async {
  await gh.lazySingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
    preResolve: true,
  );
  gh.lazySingleton<Connectivity>(() => Connectivity());
  gh.lazySingleton<ConnectivityController>(() => ConnectivityController(gh()));
  gh.lazySingleton<DeviceInfoPlugin>(() => DeviceInfoPlugin());
  gh.lazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());
  gh.lazySingleton<ImpaktfullVersionCheckRepository>(
      () => ImpaktfullVersionCheckRepository(gh()));
}

void _registerStores(
  GetItHelper gh, {
  required bool isWeb,
}) {
  gh.lazySingleton<SharedPrefsStore>(() => SharedPrefsStore(gh()));
  gh.lazySingleton<SecureStore>(() => SecureStore(gh()));
  gh.lazySingleton<KeyValueStore>(() {
    if (isWeb) return gh<SharedPrefsStore>();
    return gh<SecureStore>();
  });
  gh.lazySingleton<KeychainCleanupUtil>(() => KeychainCleanupUtil(
        secureStore: gh(),
        sharedPrefsStore: gh(),
      ));
}

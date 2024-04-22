import 'dart:convert';

import 'package:impaktfull_architecture/src/model/data/error/remote_config_no_internet_error.dart';
import 'package:impaktfull_architecture/src/model/data/remote_config/remote_config_data.dart';
import 'package:impaktfull_architecture/src/util/connectivity/connectivity.dart';
import 'package:impaktfull_architecture/src/util/logger/logger.dart';
import 'package:impaktfull_architecture/src/util/storage/shared_prefs/shared_prefs_store.dart';

abstract class RemoteConfigRepository<T extends ImpaktfullRemoteConfigData> {
  final SharedPrefsStore _sharedPrefsStore;
  final ConnectivityController _connectivityController;
  final String storageKey;

  RemoteConfigRepository(
    this._sharedPrefsStore,
    this._connectivityController, {
    this.storageKey = 'remote_config',
  });

  Future<void> init() async {
    ImpaktfullRemoteConfigData.configure(await getRemoteConfigData());
  }

  Future<T> getRemoteConfigData() async {
    try {
      if (!_connectivityController.isConnected) {
        throw RemoteConfigNoInternetError();
      }
      final remoteConfigData = await fetchRemoteConfig();
      final json = jsonEncode(toJson(remoteConfigData));
      ImpaktfullLogger.debug('REMOTE_CONFIG: Saving remote config data: $json');
      await _sharedPrefsStore.saveString(key: storageKey, value: json);
      ImpaktfullRemoteConfigData.configure(remoteConfigData);
      return remoteConfigData;
    } catch (e) {
      ImpaktfullLogger.debug(
          'REMOTE_CONFIG: Failed to fetch data from remote config, try cache');
      try {
        final json = await _sharedPrefsStore.getString(key: storageKey);
        if (json == null) {
          final remoteConfigData = await getDefault();
          ImpaktfullRemoteConfigData.configure(remoteConfigData);
          return remoteConfigData;
        }
        final jsonData = jsonDecode(json) as Map<String, dynamic>;
        final remoteConfigData = fromJson(jsonData);
        ImpaktfullRemoteConfigData.configure(remoteConfigData);
        return remoteConfigData;
      } catch (e) {
        ImpaktfullLogger.debug(
            'REMOTE_CONFIG: Failed to fetch data from cache, use default');
        final remoteConfigData = await getDefault();
        ImpaktfullRemoteConfigData.configure(remoteConfigData);
        return remoteConfigData;
      }
    }
  }

  Future<T> getDefault();

  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson(T remoteConfigData);

  Future<T> fetchRemoteConfig();
}

import 'package:impaktfull_architecture/src/util/storage/key_value/key_value_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefsStore implements KeyValueStore {
  factory SharedPrefsStore(
    SharedPreferences preferences,
  ) = _SharedPreferenceStorage;

  Future<void> reload();
}

class _SharedPreferenceStorage implements SharedPrefsStore {
  final SharedPreferences _sharedPreferences;

  _SharedPreferenceStorage(
    this._sharedPreferences,
  );

  @override
  Future<void> saveString({required String key, required String value}) =>
      _sharedPreferences.setString(key, value);

  @override
  Future<void> saveBoolean({required String key, required bool value}) =>
      _sharedPreferences.setBool(key, value);

  @override
  Future<void> saveInt({required String key, required int value}) =>
      _sharedPreferences.setInt(key, value);

  @override
  Future<void> saveDouble({required String key, required double value}) =>
      _sharedPreferences.setDouble(key, value);

  @override
  Future<String?> getString({required String key}) async =>
      _sharedPreferences.getString(key);

  @override
  Future<bool?> getBoolean({required String key}) async =>
      _sharedPreferences.getBool(key);

  @override
  Future<int?> getInt({required String key}) async =>
      _sharedPreferences.getInt(key);

  @override
  Future<double?> getDouble({required String key}) async =>
      _sharedPreferences.getDouble(key);

  @override
  Future<bool> containsKey({required String key}) async =>
      _sharedPreferences.containsKey(key);

  @override
  Future<void> removeKey({required String key}) async =>
      _sharedPreferences.remove(key);

  @override
  Future<void> reload() => _sharedPreferences.reload();
}

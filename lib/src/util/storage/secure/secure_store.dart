import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:impaktfull_architecture/src/util/storage/key_value/key_value_store.dart';

abstract class SecureStore implements KeyValueStore {
  factory SecureStore(
    FlutterSecureStorage storage,
  ) = _SecureStore;

  Future<void> deleteAll();
}

class _SecureStore implements SecureStore {
  final FlutterSecureStorage _storage;

  final iOSOptions = const IOSOptions(
    accessibility: KeychainAccessibility.unlocked,
  );

  _SecureStore(
    this._storage,
  );

  @override
  Future<void> saveString({required String key, required String value}) =>
      _storage.write(key: key, value: value, iOptions: iOSOptions);

  @override
  Future<String?> getString({required String key}) =>
      _storage.read(key: key, iOptions: iOSOptions);

  @override
  Future<void> saveBoolean({required String key, required bool value}) =>
      _storage.write(key: key, value: value.toString(), iOptions: iOSOptions);

  @override
  Future<bool?> getBoolean({required String key}) async {
    final result = await _storage.read(key: key, iOptions: iOSOptions);
    if (result == null) return null;
    return result == 'true';
  }

  @override
  Future<void> saveInt({required String key, required int value}) =>
      _storage.write(key: key, value: value.toString(), iOptions: iOSOptions);

  @override
  Future<int?> getInt({required String key}) async {
    final result = await _storage.read(key: key, iOptions: iOSOptions);
    if (result == null) return null;
    return int.tryParse(result);
  }

  @override
  Future<void> saveDouble({required String key, required double value}) =>
      _storage.write(key: key, value: value.toString(), iOptions: iOSOptions);

  @override
  Future<double?> getDouble({required String key}) async {
    final result = await _storage.read(key: key, iOptions: iOSOptions);
    if (result == null) return null;
    return double.tryParse(result);
  }

  @override
  Future<bool> containsKey({required String key}) =>
      _storage.containsKey(key: key, iOptions: iOSOptions);

  @override
  Future<void> removeKey({required String key}) =>
      _storage.delete(key: key, iOptions: iOSOptions);

  @override
  Future<void> deleteAll() => _storage.deleteAll(iOptions: iOSOptions);
}

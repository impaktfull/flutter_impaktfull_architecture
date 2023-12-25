abstract class KeyValueStore {
  Future<String?> getString({required String key});

  Future<void> saveString({required String key, required String value});

  Future<bool?> getBoolean({required String key});

  Future<void> saveBoolean({required String key, required bool value});

  Future<int?> getInt({required String key});

  Future<void> saveInt({required String key, required int value});

  Future<double?> getDouble({required String key});

  Future<void> saveDouble({required String key, required double value});

  Future<bool> containsKey({required String key});

  Future<void> removeKey({required String key});
}

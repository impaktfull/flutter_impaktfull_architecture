import 'package:impaktfull_architecture/impaktfull_architecture.dart';

class KeychainCleanupUtil {
  static const String _keyChainCleanupDateKey =
      'if.architecture.keychain_cleanup_date';
  final SecureStore secureStore;
  final SharedPrefsStore sharedPrefsStore;

  const KeychainCleanupUtil({
    required this.secureStore,
    required this.sharedPrefsStore,
  });

  Future<void> cleanup() async {
    final shouldCleanup = await _shouldCleanupKeyChain();
    if (shouldCleanup) {
      await _clearKeychain();
    }
  }

  Future<void> _saveKeyChainCleanupDate() async {
    final value = DateTime.now().toIso8601String();
    await sharedPrefsStore.saveString(
      key: _keyChainCleanupDateKey,
      value: value,
    );
  }

  Future<bool> _shouldCleanupKeyChain() async {
    final keychainCleanupDate = await sharedPrefsStore.getString(
      key: _keyChainCleanupDateKey,
    );
    return keychainCleanupDate == null;
  }

  Future<void> _clearKeychain() async {
    await secureStore.deleteAll();
    await _saveKeyChainCleanupDate();
  }
}

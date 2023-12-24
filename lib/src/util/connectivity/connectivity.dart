import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityController {
  final Connectivity _connectivity;
  ConnectivityResult? _connectionResult;

  bool get isConnected => _connectionResult != ConnectivityResult.none;

  ConnectivityResult get currentConnection =>
      _connectionResult ?? ConnectivityResult.none;

  ConnectivityController(this._connectivity);

  Future<void> initConnection({Duration? noConnectionRetryTimer}) async {
    _connectivity.onConnectivityChanged.listen(_updateConnectivity);
    await _checkConnectivity();
    if (noConnectionRetryTimer != null && !isConnected) {
      await Future.delayed(noConnectionRetryTimer);
      await _checkConnectivity();
    }
  }

  Future<void> _checkConnectivity() async {
    final connection = await _connectivity.checkConnectivity();
    _updateConnectivity(connection);
  }

  void _updateConnectivity(ConnectivityResult result) {
    _connectionResult = result;
  }
}

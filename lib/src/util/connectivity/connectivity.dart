import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityController {
  final Connectivity _connectivity;
  List<ConnectivityResult> _connectionResult = [];

  bool get isConnected =>
      _connectionResult.contains(ConnectivityResult.mobile) ||
      _connectionResult.contains(ConnectivityResult.wifi);

  List<ConnectivityResult> get currentConnection => _connectionResult;

  ConnectivityController(this._connectivity);

  Future<void> initConnection({Duration? noConnectionRetryTimer}) async {
    _connectivity.onConnectivityChanged.listen((result) => _updateConnectivity);
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

  void _updateConnectivity(List<ConnectivityResult> result) {
    _connectionResult = result;
  }
}

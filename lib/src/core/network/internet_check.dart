import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_clean_architecture/src/core/core_exports.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> isConnected() async {
    try {
      final ConnectivityResult connectivityResult =
          await Connectivity().checkConnectivity();
      return connectivityResult != ConnectivityResult.none;
    } catch (e) {
      Logger.print(message: e.toString());
      return false;
    }
  }
}

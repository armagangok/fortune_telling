import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnectivityChecker {
  NetworkConnectivityChecker._();

  static Future<bool> get status async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();

    switch (connectivityResult) {
      case ConnectivityResult.mobile:
        return true;

      case ConnectivityResult.wifi:
        return true;

      default:
        return false;
    }
  }
}

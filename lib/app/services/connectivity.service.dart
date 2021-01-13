import 'dart:io'; //InternetAddress utility
import 'dart:async'; //For StreamController/Stream

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:getxconfig/app/enum/connectstatus.dart';

class ConnectionStatusSingleton {
  //This creates the single instance by calling the `_internal` constructor specified below
  static final ConnectionStatusSingleton _singleton =
      new ConnectionStatusSingleton._internal();
  ConnectionStatusSingleton._internal();

  //This is what's used to retrieve the instance through the app
  static ConnectionStatusSingleton getInstance() => _singleton;

  //This tracks the current connection status
  bool hasConnection = false;

  //This is how we'll allow subscribing to connection changes
  StreamController connectionChangeController =
      new StreamController.broadcast();

  //flutter_connectivity
  final Connectivity _connectivity = Connectivity();

  //Hook into flutter_connectivity's Stream to listen for changes
  //And check the connection status out of the gate
  void initialize() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    checkConnection();
  }

  Stream get connectionChange => connectionChangeController.stream;

  //A clean up method to close our StreamController
  //Because this is meant to exist through the entire application life cycle this isn't really an issue
  void dispose() {
    connectionChangeController.close();
  }

  //flutter_connectivity's listener
  void _connectionChange(ConnectivityResult result) {
    _getStatusFromResult(result);
    // checkConnection();
  }

  //The test to actually see if there is a connection
  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        Get.snackbar('Ineternet', 'No internet',
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3));
        hasConnection = false;
      }
    } on SocketException catch (_) {
      Get.snackbar('Ineternet', 'No internet',
          snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 3));
      hasConnection = false;
    }

    //The connection status changed send out an update to all listeners
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }

    return hasConnection;
  }

  Future<bool> _getStatusFromResult(ConnectivityResult result) async {
    bool previousConnection = hasConnection;
    switch (result) {
      case ConnectivityResult.mobile:
        // Get.snackbar('Ineternet', ConnectivityStatus.Cellular.toString(),
        //     snackPosition: SnackPosition.BOTTOM,
        //     duration: Duration(seconds: 2));
        // if (previousConnection)
        Get.back();
        return true;
      case ConnectivityResult.wifi:
        // Get.snackbar('Ineternet', ConnectivityStatus.WiFi.toString(),
        //     snackPosition: SnackPosition.BOTTOM,
        //     duration: Duration(seconds: 2));
        // if (previousConnection)
        Get.back();
        return true;
      case ConnectivityResult.none:
        Get.snackbar('Ineternet', ConnectivityStatus.Offline.toString(),
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 2));
        previousConnection = true;
        Get.toNamed('/nointer');
        return false;
      default:
        Get.snackbar('Ineternet', ConnectivityStatus.Offline.toString(),
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 2));
        previousConnection = true;
        Get.toNamed('/nointer');
        return false;
    }
  }
}
// import 'dart:async';

// import 'package:connectivity/connectivity.dart';
// import 'package:get/get.dart';
// import 'package:getxconfig/app/enum/connectstatus.dart';

// class ConnectivityService {
//   // Create our public controller
//   StreamController<ConnectivityStatus> connectionStatusController =
//       StreamController<ConnectivityStatus>();

//   ConnectivityService() {
//     // Subscribe to the connectivity Chanaged Steam
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//       // Use Connectivity() here to gather more info if you need t

//       connectionStatusController.add(_getStatusFromResult(result));
//     });
//   }

//   // Convert from the third part enum to our own enum
//   ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
//     switch (result) {
//       case ConnectivityResult.mobile:
//         Get.snackbar('Ineternet', ConnectivityStatus.Cellular.toString(),
//             snackPosition: SnackPosition.BOTTOM,
//             duration: Duration(seconds: 2));
//         return ConnectivityStatus.Cellular;
//       case ConnectivityResult.wifi:
//         Get.snackbar('Ineternet', ConnectivityStatus.WiFi.toString(),
//             snackPosition: SnackPosition.BOTTOM,
//             duration: Duration(seconds: 2));
//         return ConnectivityStatus.WiFi;
//       case ConnectivityResult.none:
//         Get.snackbar('Ineternet', ConnectivityStatus.Offline.toString(),
//             snackPosition: SnackPosition.BOTTOM,
//             duration: Duration(seconds: 2));
//         return ConnectivityStatus.Offline;
//       default:
//         Get.snackbar('Ineternet', ConnectivityStatus.Offline.toString(),
//             snackPosition: SnackPosition.BOTTOM,
//             duration: Duration(seconds: 2));
//         return ConnectivityStatus.Offline;
//     }
//   }
// }

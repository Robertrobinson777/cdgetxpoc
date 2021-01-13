import 'package:connectivity/connectivity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxconfig/app/enum/connectstatus.dart';
import 'package:provider/provider.dart';

import 'app/routes/app_pages.dart';
import 'app/services/connectivity.service.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  runApp(MyApp());
}

// class MyApp extends StatefulWidget {
//   // bool _hasNetworkConnection = false;
//   // bool _fallbackViewOn = false;

//   // ConnectionStatusSingleton connectionStatus =
//   //     ConnectionStatusSingleton.getInstance();
//   // connectionStatus.connectionChange.listen(_updateConnectivity);

//   // void _updateConnectivity(dynamic hasConnection) {
//   //   if (!_hasNetworkConnection) {
//   //     if (!_fallbackViewOn) {
//   //       print('Ineternet' + _hasNetworkConnection.toString());
//   //       Get.snackbar('Ineternet', _fallbackViewOn.toString(),
//   //           snackPosition: SnackPosition.BOTTOM,
//   //           duration: Duration(minutes: 2));
//   //       // navigatorKey.currentState.pushNamed(FallbackConnection.route);
//   //       // setState(() {
//   //       _fallbackViewOn = true;
//   //       _hasNetworkConnection = hasConnection;
//   //       // });
//   //     }
//   //   } else {
//   //     if (_fallbackViewOn) {
//   //       print('Ineternet' + _hasNetworkConnection.toString());
//   //       Get.snackbar('Ineternet', _fallbackViewOn.toString(),
//   //           snackPosition: SnackPosition.BOTTOM,
//   //           duration: Duration(minutes: 2));
//   //       // navigatorKey.currentState.pop(context);
//   //       // setState(() {
//   //       _fallbackViewOn = false;
//   //       _hasNetworkConnection = hasConnection;
//   //       // });
//   //     }
//   //   }
//   // }

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   // var wifiBSSID;
//   // var wifiIP;
//   // var wifiName;
//   // bool iswificonnected = false;
//   // bool isInternetOn = true;

//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   CheckConnect(); // calls getconnect method to check which type if connection it
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<ConnectivityStatus>(
//         create: (context) =>
//             ConnectivityService().connectionStatusController.stream,
//         child: GetMaterialApp(
//           title: "Application",
//           initialRoute: AppPages.INITIAL,
//           getPages: AppPages.routes,
//         ));
//   }
// }

// void CheckConnect() async {
//   var connectivityResult = await (Connectivity().checkConnectivity());
//   if (connectivityResult == ConnectivityResult.none) {
//     Get.snackbar('Ineternet', 'no internet',
//         snackPosition: SnackPosition.BOTTOM, duration: Duration(minutes: 2));
//     // setState(() {
//     //   isInternetOn = false;
//     // });
//   } else if (connectivityResult == ConnectivityResult.mobile) {
//     Get.snackbar('Ineternet', connectivityResult.toString(),
//         snackPosition: SnackPosition.BOTTOM, duration: Duration(minutes: 2));
//     iswificonnected = false;
//   } else if (connectivityResult == ConnectivityResult.wifi) {
//     iswificonnected = true;
//     Get.snackbar('Ineternet', connectivityResult.toString(),
//         snackPosition: SnackPosition.BOTTOM, duration: Duration(minutes: 2));
//     // setState(() async {
//     //   wifiBSSID = await (Connectivity().checkConnectivity());
//     //   wifiIP = await (Connectivity().checkConnectivity());
//     //   wifiName = await (Connectivity().checkConnectivity());
//     // });
//   }
// }
// }

class MyApp extends StatelessWidget {
  static FirebaseInAppMessaging fiam = FirebaseInAppMessaging();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
    // return StreamProvider<ConnectivityStatus>(
    //     create: (context) =>
    //         ConnectivityService().connectionStatusController.stream,
    //     child: GetMaterialApp(
    //       title: "Application",
    //       initialRoute: AppPages.INITIAL,
    //       getPages: AppPages.routes,
    //     ));
  }
}

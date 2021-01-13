import 'package:get/get.dart';
import 'package:getxconfig/app/common/nointernet.dart';

import 'package:getxconfig/app/modules/home/bindings/home_binding.dart';
import 'package:getxconfig/app/modules/home/views/home_view.dart';
import 'package:getxconfig/app/modules/login/bindings/login_binding.dart';
import 'package:getxconfig/app/modules/login/views/login_view.dart';
import 'package:getxconfig/app/common/splashscreen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: _Paths.NOINTER,
      page: () => NoInternet(),
    ),
  ];
}

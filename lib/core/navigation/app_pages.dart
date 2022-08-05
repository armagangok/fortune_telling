import 'package:get/get.dart';

import '../../view/login/view/login_view.dart';
import '../../view/splash/view/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      // binding: BindingsBuilder(
      //   () {
      //     Get.lazyPut<SplashController>(() => SplashController());
      //   },
      // ),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => LoginView(),
      // binding: BindingsBuilder(
      //   () {
      //     Get.lazyPut<TextController>(() => TextController());
      //   },
      // ),
    ),
    // GetPage(
    //   name: _Paths.DETAIL,
    //   page: () => HomeView(),
    //   // binding: BindingsBuilder(
    //   //   () {
    //   //     // Get.lazyPut<FortuneController>(() => FortuneController());
    //   //   },
    //   // ),
    // ),
  ];
}

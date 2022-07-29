import 'package:fortune_telling/feature/view/splash/view/splash_view.dart';
import 'package:get/get.dart';
import '../../login/view/login_view.dart';
import '../bindings/splash_binding.dart';


part 'app_routes.dart';
class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () =>  SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () =>  LoginView(),
    ),
  ];
}

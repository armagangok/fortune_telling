import 'package:fortune_telling/core/bindings/find_bindings.dart';
import 'package:fortune_telling/core/bindings/login_bindings.dart';
import 'package:fortune_telling/core/bindings/personel_bindings.dart';
import 'package:fortune_telling/core/bindings/splash_screen_bindings.dart';
import 'package:fortune_telling/core/bindings/zodiac_signs_bindings.dart';
import 'package:fortune_telling/view/find/view/find_zodiac_view.dart';
import 'package:fortune_telling/view/home/view/home_view.dart';
import 'package:get/get.dart';
import '../../view/login/view/login_view.dart';
import '../../view/personal/view/personal_view.dart';
import '../../view/splash/view/splash_view.dart';
import '../../view/zodiac_signs/view/zodiac_signs_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL,
      page: () => PersonalView(),
      binding: PersonelBinding(),
      // ),
    ),
    GetPage(
      name: _Paths.FIND,
      page: () => FindZodiacView(),
      binding: FindZodiacBinding(),
    ),
    GetPage(
      name: _Paths.ZODIAC_SIGN,
      page: () => const ZodiacSignsView(),
      binding: ZodiacSignsBinding(),
    ),
  ];
}

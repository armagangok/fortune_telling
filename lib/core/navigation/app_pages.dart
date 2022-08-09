import 'package:fortune_telling/view/personal/personal_view.dart';
import 'package:fortune_telling/view/zodiac_signs/detail_view.dart';
import 'package:fortune_telling/view/zodiac_signs/zodiac_signs_view.dart';
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
      name: _Paths.LOGIN,
      page: () => LoginView(),
      // binding: BindingsBuilder(
      //   () {
      //     // Get.lazyPut<FortuneController>(() => FortuneController());
      //   },
      // ),
    ),
    GetPage(
      name: _Paths.PERSONAL,
      page: () => PersonalView(),
      // binding: BindingsBuilder(
      //   () {
      //     // Get.lazyPut<FortuneController>(() => FortuneController());
      //   },
      // ),
    ),
    GetPage(
      name: _Paths.ZODIAC_DETAIL,
      page: () => ZodiacDetailView(
        zodiacModel: Get.arguments,
      ),
      // binding: BindingsBuilder(
      //   () {
      //     // Get.lazyPut<FortuneController>(() => FortuneController());
      //   },
      // ),
    ),
    GetPage(
      name: _Paths.ZODIAC_SIGN, page: () => ZodiacSignsView(),
      // binding: BindingsBuilder(
      //   () {
      //     // Get.lazyPut<FortuneController>(() => FortuneController());
      //   },
      // ),
    ),
  ];
}

import 'package:fortune_telling/feature/login/view/login_view.dart';

import 'core/database/local/contract/storage_contract.dart';
import 'package:get_it/get_it.dart';

import 'core/database/local/my_storage.dart';
import 'core/navigation/contract/base_navigation_service.dart';
import 'core/navigation/navigation_service.dart';
import 'data/repository/fortune_controller.dart';
import 'feature/find/controller/find_zodiac_controller.dart';
import 'feature/login/controller/text_controller.dart';
import 'feature/login/controller/zodiac_controller.dart';
import 'feature/personal/controller/sign_controller.dart';
import 'feature/personal/controller/tab_controller.dart';
import 'feature/splash/controller/splash_controller.dart';
import 'feature/zodiac_signs/controller/zodiac_picker_controller.dart';
import 'feature/zodiac_signs/controller/zodiac_sign_controller.dart';
import 'feature/zodiac_signs/controller/zodiac_tab_controller.dart';

var getIt = GetIt.instance;

void initDependencies() {
  getIt.registerLazySingleton<NavigationServiceContract>(
    () => NavigationService.instance,
  );

  getIt.registerLazySingleton<SplashController>(
    () => SplashController(),
  );

  getIt.registerLazySingleton<FindZodiacController>(
    () => FindZodiacController(),
  );
  // getIt.registerLazySingleton<FindZodiacController>(() => FindZodiacController());
  getIt.registerLazySingleton<SignController>(
    () => SignController.instance,
  );

  getIt.registerLazySingleton<TabBarController>(
    () => TabBarController(),
  );

  getIt.registerLazySingleton<ZodiacController>(
    () => ZodiacController(),
  );

  getIt.registerLazySingleton<FortunesRepository>(
    () => FortunesRepository(),
  );

  getIt.registerLazySingleton<ZodiacTabController>(
    () => ZodiacTabController(),
  );

  getIt.registerLazySingleton<ZodiacPickerController>(
    () => ZodiacPickerController(),
  );
  getIt.registerLazySingleton<ZodiacSignController>(
    () => ZodiacSignController.instance,
  );

  getIt.registerLazySingleton<StorageContract>(
    () => StorageImp.instance,
  );
  getIt.registerLazySingleton<TextController>(
    () => TextController(),
  );
  getIt.registerLazySingleton<LoginView>(
    () => LoginView(),
  );

  // final zodiacTabController = getIt.call<ZodiacTabController>();
  // final zodiacPickerController = getIt.call<ZodiacPickerController>();
  // final zodiacSignController = getIt.call<ZodiacSignController>();

  // final _personalController = getIt.call<SignController>();
  // final _tabBarController = getIt.call<TabBarController>();
  // final _zodiacController = getIt.call<ZodiacController>();
}

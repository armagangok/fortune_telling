import 'package:get_it/get_it.dart';

import 'core/database/local/contract/storage_contract.dart';
import 'core/database/local/my_storage.dart';
import 'core/navigation/contract/base_navigation_service.dart';
import 'core/navigation/navigation_service.dart';
import 'data/repository/fortune_repository.dart';
import 'feature/all_sign/controller/sign_picker_controller.dart';
import 'feature/all_sign/controller/all_sign_controller.dart';
import 'feature/all_sign/controller/tab_controller.dart';
import 'feature/find/controller/find_zodiac_controller.dart';
import 'feature/login/controller/text_controller.dart';
import 'feature/login/controller/zodiac_controller.dart';
import 'feature/login/view/login_view.dart';
import 'feature/personal/controller/sign_controller.dart';
import 'feature/personal/controller/tab_controller.dart';
import 'feature/splash/controller/splash_controller.dart';

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

  getIt.registerLazySingleton<FortuneRepository>(
    () => FortuneRepository(),
  );

  getIt.registerLazySingleton<SignTabController>(
    () => SignTabController(),
  );

  getIt.registerLazySingleton<SignPickerController>(
    () => SignPickerController(),
  );
  getIt.registerLazySingleton<AllSignController>(
    () => AllSignController.instance,
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
}

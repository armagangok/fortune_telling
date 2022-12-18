import 'dart:async';

import 'package:get_storage/get_storage.dart';

import '../../../core/navigation/constant/routes.dart';
import '../../../core/navigation/contract/base_navigation_service.dart';
import '../../../injection_container.dart';

class SplashController {
  SplashController() {
    loading();
  }

  var _navigator = getIt<NavigationServiceContract>.call();

  final userdata = GetStorage();

  Future<void> loading() async {
    Timer(
      const Duration(seconds: 3),
      () {
        userdata.read('isLogged') == true
            ? _navigator.navigateTo(path: KRoute.HOME)
            : _navigator.navigateTo(path: KRoute.LOGIN_PAGE);
      },
    );
  }
}

import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/navigation/app_pages.dart';

class SplashController extends GetxController {
  SplashController._();
  static final instance = SplashController._();

  @override
  void onReady() async {
    await loading();
    super.onReady();
  }

  final userdata = GetStorage();

  Future<void> loading() async {
    Timer(
      const Duration(seconds: 10),
      () {
        userdata.read('isLogged') == true
            ? Get.offAndToNamed(Routes.HOME)
            : Get.offAndToNamed(Routes.LOGIN);
      },
    );
  }
}

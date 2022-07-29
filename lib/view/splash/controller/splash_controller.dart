import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/navigation/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    await loading();
    super.onReady();
  }

  final userdata = GetStorage();

  Future<void> loading() async {
    Timer(
      const Duration(seconds: 2),
      () {
        userdata.read('isLogged') == false
            ? Get.offAndToNamed(Routes.DETAIL)
            : Get.offAndToNamed(Routes.HOME);
      },
    );
  }
}

import 'dart:async';
import 'package:get/get.dart';
import '../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    loading();
  }

  Future<void> loading() async {
    Timer(Duration(seconds: 2), () {
      Get.offAndToNamed(Routes.HOME);
    });
  }
}

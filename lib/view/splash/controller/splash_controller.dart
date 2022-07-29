import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../routes/app_pages.dart';

class SplashController extends GetxController {
  final userdata = GetStorage();
  @override
  void onReady() {
    super.onReady();
    loading();
  }

  Future<void> loading() async {
    Timer(Duration(seconds: 2), () {
      userdata.read('isLogged') == true
          ? Get.offAndToNamed(Routes.DETAIL)
          : Get.offAndToNamed(Routes.HOME);
    });
  }
}

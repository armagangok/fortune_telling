import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    loading();
    super.onInit();
  }

  final userdata = GetStorage();

  Future<void> loading() async {
    Timer(Duration(seconds: 2), () {
      userdata.read('isLogged') == false
          ? Get.offAndToNamed(Routes.DETAIL)
          : Get.offAndToNamed(Routes.HOME);
    });
  }
}

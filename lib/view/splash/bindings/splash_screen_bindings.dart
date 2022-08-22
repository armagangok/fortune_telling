import 'package:fortune_telling/view/splash/controller/splash_controller.dart';
import 'package:get/instance_manager.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    final SplashController splashController =
        Get.put(SplashController.instance);
  }
}
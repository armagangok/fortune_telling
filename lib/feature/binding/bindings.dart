import 'package:fortune_telling/view/login/controller/text_controller.dart';
import 'package:get/instance_manager.dart';

import '../../view/splash/controller/splash_controller.dart';

class TextControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TextController>(() => TextController.instance);
  }
}

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}

import 'package:fortune_telling/view/login/controller/text_controller.dart';
import 'package:fortune_telling/view/login/controller/zodiac_controller.dart';
import 'package:get/instance_manager.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZodiacController>(() => ZodiacController()); 
    Get.lazyPut<TextController>(() => TextController()); 
  }
}

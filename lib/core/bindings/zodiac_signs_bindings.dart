import 'package:fortune_telling/view/zodiac_signs/controller/zodiac_sign_controller.dart';
import 'package:get/instance_manager.dart';

class ZodiacSignsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZodiacSignController>(() => ZodiacSignController.instance);
  }
}

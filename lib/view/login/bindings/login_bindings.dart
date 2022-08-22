import 'package:fortune_telling/view/login/controller/text_controller.dart';
import 'package:fortune_telling/view/login/controller/zodiac_controller.dart';
import 'package:get/instance_manager.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    final ZodiacController splashController =
        Get.put(ZodiacController.instance);
    final TextController textController = Get.put(TextController.instance);
  }
}

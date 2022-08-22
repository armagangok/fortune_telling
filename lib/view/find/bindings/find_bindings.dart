import 'package:fortune_telling/view/find/controller/find_zodiac_controller.dart';
import 'package:get/instance_manager.dart';

class FindZodiacBinding extends Bindings {
  @override
  void dependencies() {
    final FindZodiacController splashController =
        Get.put(FindZodiacController.instance);
  }
}

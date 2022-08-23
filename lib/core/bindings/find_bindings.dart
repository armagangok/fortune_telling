import 'package:fortune_telling/view/find/controller/find_zodiac_controller.dart';
import 'package:fortune_telling/view/login/controller/zodiac_controller.dart';
import 'package:get/instance_manager.dart';

class FindZodiacBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindZodiacController>(() => FindZodiacController());
    Get.lazyPut<ZodiacController>(() => ZodiacController());
  }
}


import 'package:get/instance_manager.dart';

import '../../feature/find/controller/find_zodiac_controller.dart';
import '../../feature/login/controller/zodiac_controller.dart';

class FindZodiacBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindZodiacController>(() => FindZodiacController());
    Get.lazyPut<ZodiacController>(() => ZodiacController());
  }
}

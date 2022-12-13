
import 'package:get/instance_manager.dart';

import '../../data/controllers/fortune_controller.dart';
import '../../feature/zodiac_signs/controller/zodiac_picker_controller.dart';
import '../../feature/zodiac_signs/controller/zodiac_sign_controller.dart';
import '../../feature/zodiac_signs/controller/zodiac_tab_controller.dart';

class ZodiacSignsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZodiacSignController>(() => ZodiacSignController.instance);
    Get.lazyPut<ZodiacPickerController>(() => ZodiacPickerController());
    Get.lazyPut<ZodiacTabController>(() => ZodiacTabController());
    Get.lazyPut<FortuneController>(() => FortuneController());
  }
}

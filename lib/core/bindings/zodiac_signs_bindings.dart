import 'package:fortune_telling/view/zodiac_signs/controller/zodiac_picker_controller.dart';
import 'package:fortune_telling/view/zodiac_signs/controller/zodiac_sign_controller.dart';
import 'package:fortune_telling/view/zodiac_signs/controller/zodiac_tab_controller.dart';
import 'package:get/instance_manager.dart';

import '../../feature/controllers/fortune_controller.dart';

class ZodiacSignsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZodiacSignController>(() => ZodiacSignController.instance);
    Get.lazyPut<ZodiacPickerController>(() => ZodiacPickerController());
    Get.lazyPut<ZodiacTabController>(() => ZodiacTabController());
    Get.lazyPut<FortuneController>(() => FortuneController());
  }
}

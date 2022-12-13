import 'package:fortune_telling/core/database/local/my_storage.dart';

import 'package:get/instance_manager.dart';

import '../../feature/login/controller/text_controller.dart';
import '../../feature/login/controller/zodiac_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZodiacController>(() => ZodiacController()); 
    Get.lazyPut<TextController>(() => TextController()); 
    Get.lazyPut<MyStorage>(() => MyStorage()); 
  }
}

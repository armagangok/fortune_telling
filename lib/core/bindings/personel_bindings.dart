
import 'package:get/instance_manager.dart';

import '../../data/controllers/fortune_controller.dart';
import '../../feature/login/controller/zodiac_controller.dart';
import '../../feature/personal/controller/sign_controller.dart';
import '../../feature/personal/controller/tab_controller.dart';
import '../database/local/my_storage.dart';

class PersonelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignController>(() => SignController.instance);
    Get.lazyPut<FortuneController>(() => FortuneController());
    Get.lazyPut<MyStorage>(() => MyStorage());
    Get.lazyPut<ZodiacController>(() => ZodiacController());
    Get.lazyPut<TabBarController>(() => TabBarController());
  }
}

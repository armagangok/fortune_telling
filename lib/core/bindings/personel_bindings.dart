import 'package:fortune_telling/view/login/controller/zodiac_controller.dart';
import 'package:fortune_telling/view/personal/controller/sign_controller.dart';
import 'package:get/instance_manager.dart';

import '../../feature/controllers/fortune_controller.dart';
import '../../view/personal/controller/tab_controller.dart';
import '../database/local/my_storage.dart';

class PersonelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignController>(() => SignController());
    Get.lazyPut<FortuneController>(() => FortuneController());
    Get.lazyPut<MyStorage>(() => MyStorage());
    Get.lazyPut<ZodiacController>(() => ZodiacController());
    Get.lazyPut<TabBarController>(() => TabBarController());
  }
}

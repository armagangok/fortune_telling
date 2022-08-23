import 'package:fortune_telling/view/personal/controller/sign_controller.dart';
import 'package:get/instance_manager.dart';

class PersonelBinding extends Bindings {
  @override
  void dependencies() {
        Get.lazyPut<SignController>(() => SignController.instance);
  }
}

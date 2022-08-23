import 'package:fortune_telling/view/login/controller/zodiac_controller.dart';
import 'package:get/get.dart';

class FindZodiacController extends GetxController {
  @override
  void onClose() {
    Get.delete<ZodiacController>();
    super.onClose();
  }

  RxString birtthDay = "".obs; // tarih
  RxString birtthDayPath = "".obs; // path
}

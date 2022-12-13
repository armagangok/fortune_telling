import 'package:get/get.dart';

import '../../login/controller/zodiac_controller.dart';

class FindZodiacController extends GetxController {
  @override
  void onClose() {
    Get.delete<ZodiacController>();
    super.onClose();
  }

  RxString birtthDay = "".obs; // tarih
  RxString birtthDayPath = "".obs; // path
}

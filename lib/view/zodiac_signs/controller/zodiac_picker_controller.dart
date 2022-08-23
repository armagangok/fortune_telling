import 'package:get/get.dart';

class ZodiacPickerController extends GetxController {
  final Rx _value = Rx(4);

  @override
  void onClose() {
    Get.delete<ZodiacPickerController>();
    super.onClose();
  }

  int get getValue => _value.value;
  set setValue(int value) => _value.value = value;
}

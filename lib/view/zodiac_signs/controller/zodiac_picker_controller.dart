import 'package:get/get.dart';

class ZodiacPickerController extends GetxController {
  static final ZodiacPickerController instance = ZodiacPickerController._();
  ZodiacPickerController._();

  final Rx _value = Rx(4);

  int get getValue => _value.value;
  set setValue(int value) => _value.value = value;
}

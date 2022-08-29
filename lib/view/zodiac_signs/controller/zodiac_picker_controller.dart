import 'package:get/get.dart';

class ZodiacPickerController extends GetxController {
  final Rx<String> choosenSign = Rx("Boğa");
  set setSign(String sign) => choosenSign.value = sign;
  
  final Rx _value = Rx(4);

  int get getValue => _value.value;
  set setValue(int value) => _value.value = value;
}

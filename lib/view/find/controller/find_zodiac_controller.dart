import 'package:get/get.dart';

class FindZodiacController extends GetxController {
  FindZodiacController._();
  static final instance = FindZodiacController._();

  final Rx<String?> birtthDay = Rx(null);

  String get getBirthday => birtthDay.string;
  set setBirthdayValue(String value) => birtthDay.value = value;

      RxString val = "".obs;
    RxString val1 = "".obs;
}

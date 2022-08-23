import 'package:get/get.dart';

class FindZodiacController extends GetxController {
  FindZodiacController._();
  static final instance = FindZodiacController._();

  RxString birtthDay = "".obs; // tarih
  RxString birtthDayPath = "".obs; // path
}

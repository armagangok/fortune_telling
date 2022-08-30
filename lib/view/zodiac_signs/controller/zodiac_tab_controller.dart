import 'package:fortune_telling/feature/controllers/tab_controller.dart';
import 'package:get/get.dart';

class ZodiacTabController extends GetxController with BaseTabControler {

  final RxInt _currentIndex = RxInt(-1);

  @override
  int get getIndex => _currentIndex.value;

  @override
  set setIndex(newIndex) => _currentIndex.value = newIndex;
}

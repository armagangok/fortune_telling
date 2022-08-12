import 'package:fortune_telling/feature/controllers/tab_controller.dart';
import 'package:get/get.dart';

class ZodiacTabController extends GetxController with BaseTabControler {
  ZodiacTabController._();
  static final instance = ZodiacTabController._();

  @override
  void onClose() {
    setIndex = -1;
    super.onClose();
  }

  final RxInt _currentIndex = RxInt(-1);

  @override
  int get getIndex => _currentIndex.value;

  @override
  set setIndex(newIndex) => _currentIndex.value = newIndex;
}

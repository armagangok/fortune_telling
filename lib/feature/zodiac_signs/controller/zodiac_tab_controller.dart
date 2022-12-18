import 'package:get/get.dart';

import '../../../domain/contract/tab_controller.dart';

class ZodiacTabController extends GetxController with BaseTabControler {
  final RxInt _currentIndex = RxInt(-1);

  @override
  int get getIndex => _currentIndex.value;

  @override
  set setIndex(newIndex) => _currentIndex.value = newIndex;
}

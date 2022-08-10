import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TabBarController extends GetxController {
  TabBarController._();
  static final instance = TabBarController._();
  final RxInt _currentIndex = RxInt(0);

  int get getIndex => _currentIndex.value;

  void changeIndex(newIndex) => _currentIndex.value = newIndex;
}

import 'package:get/get.dart';

import '../../../feature/controllers/tab_controller.dart';

class TabBarController extends GetxController with BaseTabControler {
  TabBarController._();
  static final instance = TabBarController._();

  @override
  final _currentIndex = RxInt(0);

  @override
  int get getIndex => _currentIndex.value;

  @override
  set setIndex(newIndex) => _currentIndex.value = newIndex;
}
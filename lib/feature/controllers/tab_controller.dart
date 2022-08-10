import 'package:get/get_rx/src/rx_types/rx_types.dart';

abstract class BaseTabControler {
  late RxInt _currentIndex;

   int get getIndex;
   set setIndex(int index);
}

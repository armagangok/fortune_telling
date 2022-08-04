import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../../core/database/local/my_storage.dart';
import '../../../feature/controllers/fortune_controller.dart';
import '../../../feature/models/daily_fortune_model.dart';
import '../../login/controller/zodiac_controller.dart';

class PersonalController extends GetxController {
  PersonalController._();
  static final instance = PersonalController._();

  final FortuneController _fortuneController = FortuneController.instance;
  final MyStorage _myStorage = MyStorage.instance;
  final ZodiacController _zodiacController = ZodiacController.instance;

  final Rx<String?> userName = Rx(null);
  final Rx<String?> birtthDay = Rx(null);
  Rx<DailyFortuneModel?> dailyFortune = Rx(null);

  @override
  void onInit() async {
    userName.value = _myStorage.getStorage.read("isim");
    String sign = _zodiacController.getZodicaSign(DateTime.parse(
      _myStorage.getStorage.read("birthDay"),
    ));

    dailyFortune.value = await _fortuneController.getFortune(
      sign: sign,
      time: "",
      responseType: DailyFortuneModel(),
    );

    super.onInit();
  }
}

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../core/constants/network_constant.dart';
import '../../../core/database/local/my_storage.dart';
import '../../../feature/controllers/fortune_controller.dart';
import '../../../feature/models/base_fortune_feature_model.dart';
import '../../../feature/models/daily_fortune_model.dart';
import '../../../feature/models/love_fortune_model.dart';
import '../../login/controller/zodiac_controller.dart';

class ZodiacSignController extends GetxController {
  ZodiacSignController._();
  static final instance = ZodiacSignController._();

  final FortuneController _fortuneController = FortuneController.instance;
  final MyStorage _myStorage = MyStorage.instance;
  final ZodiacController _zodiacController = ZodiacController.instance;

  final Rx<String?> userName = Rx(null);
  final Rx<String?> birtthDay = Rx(null);
  Rx<DailyFortuneModel?> dailyFortune = Rx(null);
  Rx<BaseFortuneFeatureModel?> loveFortune = Rx(null);
  Rx<BaseFortuneFeatureModel?> healthFortune = Rx(null);
  Rx<BaseFortuneFeatureModel?> careerFortune = Rx(null);

  @override
  void onInit() async {
    userName.value = _myStorage.storage.read("isim");
    String sign = _zodiacController.getZodicaSign(DateTime.parse(
      _myStorage.storage.read("birthDay"),
    ));

    dailyFortune.value = await _fortuneController.getFortune(
      sign: sign,
      time: "",
      responseType: DailyFortuneModel(),
    );
    loveFortune.value = await _fortuneController.getFortuneFeature(
      responseType: LoveFortuneModel(),
      sign: sign,
      feature: KNetwork.ask,
    );

    healthFortune.value = await _fortuneController.getFortuneFeature(
      responseType: LoveFortuneModel(),
      sign: sign,
      feature: KNetwork.saglik,
    );

    careerFortune.value = await _fortuneController.getFortuneFeature(
      responseType: LoveFortuneModel(),
      sign: sign,
      feature: KNetwork.kariyer,
    );

    super.onInit();
  }
}

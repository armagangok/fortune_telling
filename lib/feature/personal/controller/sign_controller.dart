import 'package:fortune_telling/core/database/local/contract/storage_contract.dart';
import 'package:get/get.dart';

import '../../../core/constants/network_constant.dart';
import '../../../data/repository/fortune_controller.dart';
import '../../../feature/models/base_fortune_feature_model.dart';
import '../../../feature/models/daily_fortune_model.dart';
import '../../../feature/models/love_fortune_model.dart';
import '../../../injection_container.dart';
import '../../login/controller/zodiac_controller.dart';

class SignController {
  SignController._() {
    onInit();
  }
  static final instance = SignController._();

  final _fortuneController = getIt.call<FortunesRepository>();
  final _zodiacController = getIt.call<ZodiacController>();
  final _myStorage = getIt.call<StorageContract>();

  final Rx<String?> userName = Rx(null);
  final Rx<String?> birtthDay = Rx(null);
  Rx<DailyFortuneModel?> dailyFortune = Rx(null);
  Rx<BaseFortuneFeatureModel?> loveFortune = Rx(null);
  Rx<BaseFortuneFeatureModel?> healthFortune = Rx(null);
  Rx<BaseFortuneFeatureModel?> careerFortune = Rx(null);

  Future<void> onInit() async {
    userName.value = await _myStorage.read("isim");
    String sign = _zodiacController.getZodicaSign(
      DateTime.parse(
        await _myStorage.read("birthDay"),
      ),
    );

    dailyFortune.value = await _fortuneController.getFortune(
      sign: sign,
      time: "",
      responseType: DailyFortuneModel(),
    );

    loveFortune.value = await _fortuneController.getFortuneFeature(
      responseType: LoveFortuneModel(),
      sign: sign,
      feature: KNetwork.love,
    );

    healthFortune.value = await _fortuneController.getFortuneFeature(
      responseType: LoveFortuneModel(),
      sign: sign,
      feature: KNetwork.health,
    );

    careerFortune.value = await _fortuneController.getFortuneFeature(
      responseType: LoveFortuneModel(),
      sign: sign,
      feature: KNetwork.career,
    );
  }
}

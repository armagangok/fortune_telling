import 'package:get/get.dart';
import '../../../core/constants/network_constant.dart';
import '../../../feature/controllers/fortune_controller.dart';
import '../../../feature/models/base_fortune_feature_model.dart';
import '../../../feature/models/career_fortune_model.dart';
import '../../../feature/models/daily_fortune_model.dart';
import '../../../feature/models/love_fortune_model.dart';
import '../../../feature/models/monthly_fortune_model.dart';
import '../../../feature/models/weekly_fortune_model.dart';
import '../../../feature/models/yearly_fortune_model.dart';

class ZodiacSignController extends GetxController {
  static final ZodiacSignController _inst = ZodiacSignController._();
  ZodiacSignController._();

  factory ZodiacSignController({String newSign = ""}) {
    _inst.sign = newSign;
    return _inst;
  }

  /* @override
  void dispose() {
    Get.delete<ZodiacSignController>();
    super.dispose();
  } */
  
  @override
  void onClose() {
    Get.delete<ZodiacSignController>();
    /* monthlyFortune.value = null;
    weaklyFortune.value = null;
    yearlyFortune.value = null;
    loveFortune.value = null;
    healthFortune.value = null;
    careerFortune.value = null; */
    super.onClose();
  }

  final FortuneController _fortuneController = FortuneController.instance;

  String? sign;

  // @override
  // void onInit() {
  //   super.onInit();
  //   getDailyFortune(sign!);
  //   getYearlyFortune(sign!);
  //   getWeeklyFortune(sign!);
  //   getMonthlyFortune(sign!);
  //   getLoveFortune(sign!);
  //   getHealthFortune(sign!);
  //   getCareerFortune(sign!);
  // }

  Rx<DailyFortuneModel?> dailyFortune = Rx(null);
  Rx<DailyFortuneModel?> monthlyFortune = Rx(null);
  Rx<DailyFortuneModel?> weaklyFortune = Rx(null);
  Rx<DailyFortuneModel?> yearlyFortune = Rx(null);
  Rx<BaseFortuneFeatureModel?> loveFortune = Rx(null);
  Rx<BaseFortuneFeatureModel?> healthFortune = Rx(null);
  Rx<BaseFortuneFeatureModel?> careerFortune = Rx(null);

  Future<void> getDailyFortune(String sign) async {
    dailyFortune.value = await _fortuneController.getFortune(
      sign: sign,
      time: "",
      responseType: DailyFortuneModel(),
    );
  }

  Future<void> getWeeklyFortune(String sign) async {
    weaklyFortune.value = await _fortuneController.getFortune(
      sign: sign,
      time: KNetwork.weekly,
      responseType: WeeklyFortuneModel(),
    );
  }

  Future<void> getMonthlyFortune(String sign) async {
    weaklyFortune.value = await _fortuneController.getFortune(
      sign: sign,
      time: KNetwork.monthly,
      responseType: MonthlyFortuneModel(),
    );
  }

  Future<void> getYearlyFortune(String sign) async {
    yearlyFortune.value = await _fortuneController.getFortune(
      sign: sign,
      time: KNetwork.yearly,
      responseType: YearlyFortuneModel(),
    );
  }

  Future<void> getLoveFortune(String sign) async {
    loveFortune.value = await _fortuneController.getFortuneFeature(
      responseType: LoveFortuneModel(),
      sign: sign,
      feature: KNetwork.love,
    );
  }

  Future<void> getHealthFortune(String sign) async {
    healthFortune.value = await _fortuneController.getFortuneFeature(
      responseType: LoveFortuneModel(),
      sign: sign,
      feature: KNetwork.health,
    );
  }

  Future<void> getCareerFortune(String sign) async {
    careerFortune.value = await _fortuneController.getFortuneFeature(
      responseType: CareerFortuneModel(),
      sign: sign,
      feature: KNetwork.career,
    );
  }

  // Future<void> getFortuneModel(String sign) async {}
}

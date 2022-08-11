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
  static final ZodiacSignController instance = ZodiacSignController._();
  ZodiacSignController._();

  @override
  void onClose() {
    cleanUp();
    super.onClose();
  }

  final FortuneController _fortuneController = FortuneController.instance;

  final Rx<String> _choosenSign = Rx("Boğa");
  final Rx<DailyFortuneModel?> dailyFortune = Rx(null);
  final Rx<MonthlyFortuneModel?> monthlyFortune = Rx(null);
  final Rx<WeeklyFortuneModel?> weeklyFortune = Rx(null);
  final Rx<YearlyFortuneModel?> yearlyFortune = Rx(null);
  final Rx<BaseFortuneFeatureModel?> loveFortune = Rx(null);
  final Rx<BaseFortuneFeatureModel?> healthFortune = Rx(null);
  final Rx<BaseFortuneFeatureModel?> careerFortune = Rx(null);

  String get getChoosenSign => _choosenSign.value;
  set setSign(String sign) => _choosenSign.value = sign;

  Future<void> getDailyFortune(String sign) async {
    dailyFortune.value = await _fortuneController.getFortune(
      sign: sign,
      time: "",
      responseType: DailyFortuneModel(),
    );
  }

  Future<void> getWeeklyFortune(String sign) async {
    weeklyFortune.value = await _fortuneController.getFortune(
      sign: sign,
      time: KNetwork.weekly,
      responseType: WeeklyFortuneModel(),
    );
  }

  Future<void> getMonthlyFortune(String sign) async {
    monthlyFortune.value = await _fortuneController.getFortune(
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

  void cleanUp() {
    dailyFortune.value = null;
    monthlyFortune.value = null;
    weeklyFortune.value = null;
    yearlyFortune.value = null;
    loveFortune.value = null;
    healthFortune.value = null;
    careerFortune.value = null;
  }
}

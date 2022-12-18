import 'package:get/get.dart';

import '../../../core/constants/network_constant.dart';
import '../../../data/entitity/fortune_entity.dart';
import '../../../data/repository/fortune_repository.dart';
import '../../../injection_container.dart';
import '../../models/base_fortune_feature_model.dart';

class ZodiacSignController extends GetxController {
  ZodiacSignController._();
  static final instance = ZodiacSignController._();

  final _fortuneController = getIt.call<FortunesRepository>();

  final Rx<FortuneEntity?> fortuneModel = Rx(null);

  Future<void> getDailyFortune(String sign) async {
    fortuneModel.value = null;
    fortuneModel.value = await _fortuneController.getFortune(
      sign: sign,
      time: "",
      responseType: FortuneModel(),
    );
  }

  Future<void> getFortune(String sign) async {
    fortuneModel.value = null;
    fortuneModel.value = await _fortuneController.getFortune(
      sign: sign,
      time: KNetwork.monthly,
      responseType: FortuneModel(),
    );
  }
}

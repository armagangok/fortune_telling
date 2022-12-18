import 'package:fortune_telling/core/utils/logger.dart';
import 'package:get/get.dart';

import '../../../core/constants/network_constant.dart';
import '../../../data/entitity/fortune_entity.dart';
import '../../../data/repository/fortune_repository.dart';
import '../../../injection_container.dart';
import '../../../data/models/fortune_model.dart';

class AllSignController extends GetxController {
  AllSignController._();
  static final instance = AllSignController._();

  final _fortuneController = getIt.call<FortuneRepository>();

  final Rx<FortuneEntity?> fortuneModel = Rx(null);

  Future<void> getFortune(String sign) async {
    fortuneModel.value = null;

    var response = await _fortuneController.getFortune(
      sign: sign,
      time: KNetwork.monthly,
      responseType: FortuneModel(),
    );

    response.fold(
      (l) => LogHelper.shared.debugPrint("$l"),
      (r) => fortuneModel.value = r,
    );
  }
}

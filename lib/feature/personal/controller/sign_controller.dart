import 'package:fortune_telling/core/utils/logger.dart';
import 'package:get/get.dart';

import '../../../core/database/local/contract/storage_contract.dart';
import '../../../data/entitity/fortune_entity.dart';
import '../../../data/repository/fortune_repository.dart';
import '../../../injection_container.dart';
import '../../login/controller/zodiac_controller.dart';
import '../../../data/models/fortune_model.dart';

class SignController {
  SignController._() {
    _onInit();
  }
  static final instance = SignController._();

  final _fortuneController = getIt.call<FortuneRepository>();
  final _zodiacController = getIt.call<ZodiacController>();
  final _myStorage = getIt.call<StorageContract>();

  final Rx<String?> userName = Rx(null);
  final Rx<String?> birtthDay = Rx(null);
  Rx<FortuneEntity?> fortuneModel = Rx(null);

  Future<void> _onInit() async {
    userName.value = await _myStorage.read("isim");
    String sign = _zodiacController.getZodicaSign(
      DateTime.parse(
        await _myStorage.read("birthDay"),
      ),
    );

    var response = await _fortuneController.getFortune(
      sign: sign,
      time: "",
      responseType: FortuneModel(),
    );

    response.fold(
      (l) {
        LogHelper.shared.debugPrint("$l");
      },
      (r) => fortuneModel.value = r,
    );
  }
}

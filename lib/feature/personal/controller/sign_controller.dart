import 'package:get/get.dart';

import '../../../core/database/local/contract/storage_contract.dart';
import '../../../data/entitity/fortune_entity.dart';
import '../../../data/repository/fortune_repository.dart';
import '../../../injection_container.dart';
import '../../login/controller/zodiac_controller.dart';
import '../../models/base_fortune_feature_model.dart';

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
  Rx<FortuneEntity?> fortuneModel = Rx(null);

  Future<void> onInit() async {
    userName.value = await _myStorage.read("isim");
    String sign = _zodiacController.getZodicaSign(
      DateTime.parse(
        await _myStorage.read("birthDay"),
      ),
    );

    fortuneModel.value = await _fortuneController.getFortune(
      sign: sign,
      time: "",
      responseType: FortuneModel(),
    );
  }
}

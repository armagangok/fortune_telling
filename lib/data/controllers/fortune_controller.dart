import 'package:get/get_state_manager/get_state_manager.dart';

import '../../core/network/layers/network_executer.dart';
import '../../core/network/request_options.dart/request_options.dart';
import '../../feature/models/base_fortune_feature_model.dart';
import '../../feature/models/base_fortune_model.dart';

class FortuneController extends GetxController {


  Future<dynamic> getFortune({
    String? sign,
    String? time,
    required BaseFortuneModel responseType,
  }) async {
    List<dynamic> data = await NetworkExecuter.request(
      options: MyRequestOptions.instance.requestOptions(
        sign: sign,
        time: time,
      ),
      responseType: responseType,
    );

    return data[0];
  }

  Future<BaseFortuneFeatureModel> getFortuneFeature({
    String? getType,
    String? sign,
    String? feature,
    required BaseFortuneFeatureModel responseType,
  }) async {
    List<dynamic> data = await NetworkExecuter.request(
      options: MyRequestOptions.instance.requestFeatureOptions(
        sign: sign,
        feature: feature,
      ),
      responseType: responseType,
    );

    return data[0];
  }
}

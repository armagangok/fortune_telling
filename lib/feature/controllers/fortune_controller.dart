import 'package:get/get_state_manager/get_state_manager.dart';

import '../../core/network/layers/network_executer.dart';
import '../../core/network/request_options.dart/request_options.dart';
import '../models/base_fortune_feature_model.dart';
import '../models/base_fortune_model.dart';

class FortuneController extends GetxController {
  FortuneController._();
  static final instance = FortuneController._();

  Future<dynamic> getFortune({
    String? sign,
    String? time,
    required BaseFortuneModel responseType,
  }) async {
    List<dynamic> a = await NetworkExecuter.request(
      options: MyRequestOptions.instance.requestOptions(
        sign: sign,
        time: time,
      ),
      responseType: responseType,
    );

    return a[0];
  }

  Future getFortuneFeature({
    String? getType,
    String? sign,
    String? feature,
    required BaseFortuneFeatureModel responseType,
  }) async {
    await NetworkExecuter.request(
      options: MyRequestOptions.instance.requestFeatureOptions(
        sign: sign,
        feature: feature,
      ),
      responseType: responseType,
    );
  }
}

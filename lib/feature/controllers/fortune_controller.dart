import 'package:get/get_state_manager/get_state_manager.dart';
import '../../core/network/layers/network_executer.dart';
import '../../core/network/request_options.dart/request_options.dart';
import '../models/base_fortune_feature_model.dart';
import '../models/base_fortune_model.dart';

class FortuneController extends GetxController {
  Future getFortune(
      {String? getType,
      String? sign,
      String? time,
      required BaseFortuneModel responseType}) async {
    List<BaseFortuneModel> a = await NetworkExecuter.request(
      options: MyRequestOptions.instance.requestOptions(
        getType: getType,
        sign: sign,
        time: time,
      ),
      responseType: responseType,
    );

    print(a[0].fortune);
    print(a[0].burc);
    print(a[0].elementi);
    print(a[0].mottosu);
    print(a[0].zaman);
  }

  Future getFortuneFeature(
      {String? getType,
      String? sign,
      String? feature,
      required BaseFortuneFeatureModel responseType}) async {
    List<BaseFortuneFeatureModel> a = await NetworkExecuter.request(
      options: MyRequestOptions.instance.requestFeatureOptions(
        sign: sign,
        feature: feature,
      ),
      responseType: responseType,
    );

    print(a[0].yorum);
    print(a[0].burc);
    print(a[0].ozellik);
    print(a[0].baslik);
    print(a[0].unluler);
  }
}
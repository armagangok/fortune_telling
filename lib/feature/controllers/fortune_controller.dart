import 'package:fortune_telling/feature/models/base_fortune_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../core/network/layers/network_executer.dart';
import '../../core/network/request_options.dart/request_options.dart';
import '../models/daily_fortune_model.dart';

class FortuneController extends GetxController {
  // @override
  // void onInit() {
  //   getFortune("yay");
  //   super.onInit();
  // }

  Future getFortune({String? getType, String? sign, String? time}) async {
    List<BaseFortuneModel> a = await NetworkExecuter.request(
      options: MyRequestOptions.instance.requestOptions(
        getType: getType,
        sign: sign,
        time: time,
      ),
      responseType: DailyFortuneModel(),
    );

    print(a[0].fortune);
    print(a[0].burc);
    print(a[0].elementi);
    print(a[0].mottosu);
    print(a[0].zaman);
  }
}

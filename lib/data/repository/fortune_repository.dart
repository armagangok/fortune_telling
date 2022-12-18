import '../../core/network/layers/network_executer.dart';
import '../../core/network/request_options.dart/request_options.dart';
import '../models/fortune_model.dart';

class FortunesRepository {
  Future<dynamic> getFortune({
    String? sign,
    String? time,
    required FortuneModel responseType,
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
}

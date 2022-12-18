import 'package:dartz/dartz.dart';

import '../../core/failure/failure.dart';
import '../../core/network/layers/network_executer.dart';
import '../../core/network/request_options.dart/request_options.dart';
import '../models/fortune_model.dart';

class FortuneRepository {
  Future<Either<Failure, FortuneModel>> getFortune({
    String? sign,
    String? time,
    required FortuneModel responseType,
  }) async {
    try {
      dynamic data = await NetworkExecuter.request(
        options: MyRequestOptions.instance.requestOptions(
          sign: sign,
          time: time,
        ),
        responseType: responseType,
      );

      return data;
    } catch (e) {
      return Left(NetworkFetchFailure());
    }
  }
}

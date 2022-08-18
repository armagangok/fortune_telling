import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../utils/logger.dart';
import '../contracts/base_network_model.dart';
import 'network_connectivity_checker.dart';
import 'network_decoder.dart';
import 'network_requestor.dart';

class NetworkExecuter {
  NetworkExecuter._();

  static Future<K?> request<T extends BaseNetworkModel, K>({
    required RequestOptions options,
    required T responseType,
  }) async {
    if (await NetworkConnectivityChecker.status) {
      try {
        var response = await NetworkRequestor.sendRequest(options: options);
        var decodedResponse = NetworkDecoder.decode<T, K>(
          response: response,
          responseType: responseType,
        );
        return decodedResponse;
      } on DioError catch (dioError) {
        LogHelper.shared.debugPrint("Dio Error $dioError");
        Get.snackbar("Uyarı", dioError.message);
      } on TypeError catch (e) {
        LogHelper.shared.debugPrint("Type Error $e");
        Get.snackbar("Uyarı", "$e");
      }
    } else {
      Get.snackbar("Uyarı", " İnternet bağlantınız yok");
      LogHelper.shared.debugPrint("No Internet Connection ");
    }
    return null;
  }
}

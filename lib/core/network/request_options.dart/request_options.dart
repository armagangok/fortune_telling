import 'package:dio/dio.dart';

class MyRequestOptions {
  MyRequestOptions._();
  static final instance = MyRequestOptions._();

  RequestOptions requestOptions({
    String? sign,
    String? time,
    String? feature,
  }) =>
      RequestOptions(
        baseUrl: "https://burc-yorumlari.herokuapp.com/get",
        path: "/$sign/$time",
      );

  RequestOptions requestFeatureOptions({
    String? sign,
    String? feature,
  }) =>
      RequestOptions(
        baseUrl: "https://burc-yorumlari.herokuapp.com/gets",
        path: "/$sign/$feature",
      );
}

import 'package:dio/dio.dart';

class MyRequestOptions {
  MyRequestOptions._();
  static final instance = MyRequestOptions._();

  RequestOptions requestOptions({
    String? sign,
    String? getType,
    String? time,
  }) =>
      RequestOptions(
        baseUrl: "https://burc-yorumlari.herokuapp.com",
        path: "/$getType/$sign/$time",
      );

  // String getType(String getType) => getType;
  // String signType(String signType) => signType;
  // String getTime(String time) => time;
}

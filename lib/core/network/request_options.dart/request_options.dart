import 'package:dio/dio.dart';

class MyRequestOptions {
  MyRequestOptions._();
  static final instance = MyRequestOptions._();

  RequestOptions requestoptions(String sign) => RequestOptions(
        baseUrl: "https://burc-yorumlari.herokuapp.com",
        path: "/get/$sign",
      );

  // String getType(String getType) => getType;
  // String signType(String signType) => signType;
  // String getTime(String time) => time;
}

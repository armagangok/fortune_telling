import 'package:dio/dio.dart';

class MyRequestOptions {
  MyRequestOptions._();
  // static final instance = MyRequestOptions._();

  static final RequestOptions requestoptions = RequestOptions(
    path: "https://burc-yorumlari.herokuapp.com/get/aslan/yillik",
  );
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fortune_telling/core/network/layers/network_executer.dart';
import 'package:fortune_telling/core/view/test_model.dart';

void main() {
  test("Network Test", () async {
    WidgetsFlutterBinding.ensureInitialized();
    var a = await NetworkExecuter.request(
      options: RequestOptions(
        path: "https://burc-yorumlari.herokuapp.com/get/aslan",
      ),
      responseType: TestModel(),
    );

    print(a);
  });
}

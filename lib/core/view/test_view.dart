import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../network/layers/network_executer.dart';
import 'test_model.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            List<TestModel> a = await NetworkExecuter.request(
              options: RequestOptions(
                path: "https://burc-yorumlari.herokuapp.com/get/aslan",
              ),
              responseType: TestModel(),
            );

            for (var element in a) {
              print(element.gunlukYorum);
            }
          },
          icon: const Text("press"),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fortune_telling/feature/models/yearly_fortune_model.dart';

import 'core/network/layers/network_executer.dart';
import 'core/network/request_options.dart/request_options.dart';
import 'test_model.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            List<YearlyFortuneModel> a = await NetworkExecuter.request(
              options: MyRequestOptions.requestoptions,
              responseType: YearlyFortuneModel(),
            );

            for (var element in a) {
              print(element.burc);
              print(element.fortune);
              print(element.elementi);
            }
          },
          icon: const Text("press"),
        ),
      ),
    );
  }
}

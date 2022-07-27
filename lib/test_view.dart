import 'package:flutter/material.dart';
import 'package:fortune_telling/feature/controllers/fortune_controller.dart';
import 'package:get/instance_manager.dart';

class TestView extends StatelessWidget {
  TestView({Key? key}) : super(key: key);

  final FortuneController fortuneController = Get.put(FortuneController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            await fortuneController.getFortune("yay");
          },
          icon: const Text("press"),
        ),
      ),
    );
  }
}

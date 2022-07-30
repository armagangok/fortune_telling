import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../core/database/local/my_storage.dart';
import '../../feature/controllers/fortune_controller.dart';
import '../../feature/models/career_fortune_model.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final FortuneController fortuneController = Get.put(FortuneController());
  final MyStorage myStorage = MyStorage.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () async {
              await fortuneController.getFortuneFeature(
                getType: "gets",
                sign: "aslan",
                feature: "ask",
                responseType: CareerFortuneModel(),
              );
            },
            icon: const Text("press"),
          ),
        ),
        body: Column(
          children: [Text("NAME : ${myStorage.getStrogare.read('isim')}")],
        ),
      ),
    );
  }
}

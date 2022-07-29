import 'package:flutter/material.dart';
import 'package:fortune_telling/feature/controllers/fortune_controller.dart';
import 'package:fortune_telling/feature/models/career_fortune_model.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final FortuneController fortuneController = Get.put(FortuneController());
  final userdata = GetStorage();

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
          children: [Text("NAME : ${userdata.read('isim')}")],
        ),
      ),
    );
  }
}

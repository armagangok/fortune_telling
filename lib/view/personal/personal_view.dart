import 'package:flutter/material.dart';
import 'package:fortune_telling/core/constants/asset_constant.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

import 'controller/personal_controller.dart';

class PersonalView extends StatelessWidget {
  PersonalView({Key? key}) : super(key: key);

  final PersonalController _personalController =
      Get.put(PersonalController.instance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: Obx(
        () => Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(KAsset.backgroundImage), fit: BoxFit.cover),
          ),
          child: ListView(
            children: [
              Image.asset(KAsset.yay),
              Text(_personalController.userName.value!),
              Text(_personalController.dailyFortune.value!.fortune!),
            ],
          ),
        ),
      ),
    );
  }
}

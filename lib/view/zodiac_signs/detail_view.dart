import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/zodiac_sign_controller.dart';
import 'zodiac_signs_view.dart';

class ZodiacDetailView extends StatelessWidget {
  const ZodiacDetailView({
    Key? key,
    required this.zodiacModel,
  }) : super(key: key);

  final ZodiacModel zodiacModel;

  @override
  Widget build(BuildContext context) {
    print(zodiacModel.zodiacName);
    final ZodiacSignController zodiacSignController =
        Get.put(ZodiacSignController(newSign: zodiacModel.zodiacName));
    zodiacSignController.getDailyFortune(zodiacModel.zodiacName);
    return Scaffold(
      appBar: AppBar(
        title: Text(zodiacModel.zodiacName),
      ),
      body: Obx(() => zodiacSignController.dailyFortune.value != null
          ? Text(zodiacSignController.dailyFortune.value!.fortune!)
          : const SizedBox()),
    );
  }
}

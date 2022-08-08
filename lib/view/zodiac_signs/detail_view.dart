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
    final ZodiacSignController zodiacSignController =
        Get.put(ZodiacSignController(newSign: zodiacModel.zodiacName));
    zodiacSignController.getDailyFortune(zodiacModel.zodiacName);
    return Scaffold(
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => zodiacSignController.dailyFortune.value!.fortune != null
                ? Text(zodiacSignController.dailyFortune.value!.fortune!)
                : const SizedBox(),
          ),
          Obx(
            () => zodiacSignController.dailyFortune.value!.elementi != null
                ? Text(zodiacSignController.dailyFortune.value!.elementi!)
                : const SizedBox(),
          ),
          Obx(
            () => zodiacSignController.dailyFortune.value!.mottosu != null
                ? Text(zodiacSignController.dailyFortune.value!.mottosu!)
                : const SizedBox(),
          ),
          Obx(
            () => zodiacSignController.dailyFortune.value!.gezegeni != null
                ? Text(zodiacSignController.dailyFortune.value!.gezegeni!)
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(zodiacModel.zodiacName),
    );
  }
}

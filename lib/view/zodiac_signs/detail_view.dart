import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortune_telling/feature/components/tab_bar_widget.dart';
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
      appBar: appBar(zodiacSignController),
      body: Obx(() => const TabBarWidget(widgetList: [])),
    );
  }

  AppBar appBar(zodiacSignController) {
    return AppBar(
      leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () {
            //  zodiacSignController.dailyFortune.value = null;
            Get.back();
          }),
      title: Text(zodiacModel.zodiacName),
    );
  }
}


// zodiacSignController.dailyFortune.value != null
//             ? Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   zodiacSignController.dailyFortune.value!.fortune != null
//                       ? Text(zodiacSignController.dailyFortune.value!.fortune!)
//                       : const SizedBox(),
//                   zodiacSignController.dailyFortune.value!.elementi != null
//                       ? Text(zodiacSignController.dailyFortune.value!.elementi!)
//                       : const SizedBox(),
//                   zodiacSignController.dailyFortune.value!.mottosu != null
//                       ? Text(zodiacSignController.dailyFortune.value!.mottosu!)
//                       : const SizedBox(),
//                   zodiacSignController.dailyFortune.value!.gezegeni != null
//                       ? Text(zodiacSignController.dailyFortune.value!.gezegeni!)
//                       : const SizedBox(),
//                 ],
//               )
//             : const Center(
//                 child: CircularProgressIndicator(),
//               ),
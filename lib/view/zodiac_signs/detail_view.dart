import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortune_telling/core/constants/network_constant.dart';
import 'package:fortune_telling/feature/components/tab_bar_widget.dart';
import 'package:fortune_telling/view/personal/controller/tab_controller.dart';
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
    final TabBarController tabBarController =
        Get.put(TabBarController.instance);
    final ZodiacSignController zodiacSignController =
        Get.put(ZodiacSignController(newSign: zodiacModel.zodiacName));
    zodiacSignController.getDailyFortune(zodiacModel.zodiacName);
    return Scaffold(
        appBar: appBar(zodiacSignController),
        body: ListView(
          children: [
            TabBarWidget(
              widgetList: [
                ExpandedItem(
                  text: "Daily",
                  clickedNumber: 0,
                  tabControler: tabBarController,
                  onTap: () {
                    tabBarController.setIndex = 0;
                  },
                ),
                ExpandedItem(
                  text: KNetwork.weekly,
                  clickedNumber: 1,
                  tabControler: tabBarController,
                  onTap: () {
                    tabBarController.setIndex = 1;
                  },
                ),
                ExpandedItem(
                  text: KNetwork.monthly,
                  tabControler: tabBarController,
                  clickedNumber: 2,
                  onTap: () {
                    tabBarController.setIndex = 2;
                  },
                ),
                ExpandedItem(
                  text: KNetwork.yearly,
                  clickedNumber: 3,
                  tabControler: tabBarController,
                  onTap: () {
                    tabBarController.setIndex = 3;
                  },
                ),
              ],
            ),
          ],
        ));
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
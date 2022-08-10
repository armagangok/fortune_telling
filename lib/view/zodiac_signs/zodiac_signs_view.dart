import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:skeletons/skeletons.dart';

import '../../core/extension/context_extension.dart';
import '../../feature/components/tab_bar_widget.dart';
import '../../feature/data/data.dart';
import '../../feature/models/zodiac_model.dart';
import 'controller/zodiac_picker_controller.dart';
import 'controller/zodiac_sign_controller.dart';
import 'controller/zodiac_tab_controller.dart';

class ZodiacSignsView extends StatefulWidget {
  const ZodiacSignsView({Key? key}) : super(key: key);

  @override
  State<ZodiacSignsView> createState() => _ZodiacSignsViewState();
}

final ZodiacTabController tabBarController =
    Get.put(ZodiacTabController.instance);
final ZodiacPickerController zodiacPickerController =
    Get.put(ZodiacPickerController.instance);
final ZodiacSignController zodiacSignController =
    Get.put(ZodiacSignController.instance);

class _ZodiacSignsViewState extends State<ZodiacSignsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: Padding(
          padding: context.symmetric(horizontal: 0.025),
          child: Column(
            children: [
              SizedBox(
                width: context.width(1),
                height: context.height(0.16),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: buildCupertinoPicker(),
                ),
              ),
              buildTabBar(),
              SizedBox(height: context.height(0.025)),
              SizedBox(
                height: context.height(0.63),
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Obx(() => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(CupertinoIcons.dot_square),
                            zodiacSignController.dailyFortune.value != null
                                ? Text(zodiacSignController
                                    .dailyFortune.value!.elementi!)
                                :  skeleton15Line(),
                            SizedBox(width: context.width(0.025)),
                            const Icon(CupertinoIcons.dot_square),
                            zodiacSignController.dailyFortune.value != null
                                ? Text(zodiacSignController
                                    .dailyFortune.value!.gezegeni!)
                                : skeleton15Line(),
                          ],
                        )),
                    function(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget skeleton15Line() {
    return Builder(builder: (context) {
      return SizedBox(
        width: context.width(0.094),
        child: const SkeletonLine(),
      );
    });
  }

  Widget buildCupertinoPicker() {
    return Builder(builder: (context) {
      return CupertinoPicker(
        selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
          background: Colors.transparent,
        ),
        scrollController: FixedExtentScrollController(initialItem: 3),
        useMagnifier: true,
        magnification: 1.2,
        offAxisFraction: 0.1,
        itemExtent: context.width(0.18),
        onSelectedItemChanged: (value) {
          zodiacSignController.choosenSign.value =
              Data.zodiacs[value].zodiacName;
          ZodiacTabController.instance.setIndex = -1;
          zodiacPickerController.setValue = value;
        },
        children: Data.zodiacs.map((item) => signPicker(item)).toList(),
      );
    });
  }

  Widget function() {
    switch (tabBarController.getIndex) {
      case 0:
        return const Text("data");

      case 1:
        return const Text("data");

      case 2:
        return const Text("data");

      case 3:
        return const Text("data");

      default:
        return const Text("data");
    }
  }

  AppBar appBar() {
    return AppBar(
      title: Obx(() => Text(zodiacSignController.choosenSign.value)),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    );
  }

  Center signPicker(ZodiacModel item) {
    return Center(
      child: RotatedBox(
        quarterTurns: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.4),
            ),
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              item.path,
              scale: 1,
            ),
          ),
        ),
      ),
    );
  }

  TabBarWidget buildTabBar() {
    final String sign = zodiacSignController.choosenSign.value;

    return TabBarWidget(
      widgetList: [
        ExpandedItem2(
          text: "Günlük",
          clickedNumber: 0,
          tabBarController: tabBarController,
          onTap: () async {
            tabBarController.setIndex = 0;
            await zodiacSignController.getDailyFortune(sign);
          },
        ),
        ExpandedItem2(
          text: "Haftalık",
          clickedNumber: 1,
          tabBarController: tabBarController,
          onTap: () async {
            tabBarController.setIndex = 1;
            await zodiacSignController.getWeeklyFortune(sign);
          },
        ),
        ExpandedItem2(
          text: "Aylık",
          tabBarController: tabBarController,
          clickedNumber: 2,
          onTap: () async {
            tabBarController.setIndex = 2;
            await zodiacSignController.getMonthlyFortune(sign);
          },
        ),
        ExpandedItem2(
          text: "Yıllık",
          clickedNumber: 3,
          tabBarController: tabBarController,
          onTap: () async {
            tabBarController.setIndex = 3;
            await zodiacSignController.getWeeklyFortune(sign);
          },
        ),
      ],
    );
  }
}

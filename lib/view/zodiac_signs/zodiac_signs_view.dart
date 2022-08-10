import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortune_telling/view/zodiac_signs/controller/zodiac_picker_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

import '../../core/constants/network_constant.dart';
import '../../core/extension/context_extension.dart';
import '../../feature/components/tab_bar_widget.dart';
import '../../feature/data/data.dart';
import '../../feature/models/zodiac_model.dart';
import '../personal/controller/tab_controller.dart';

class ZodiacSignsView extends StatefulWidget {
  const ZodiacSignsView({Key? key}) : super(key: key);

  @override
  State<ZodiacSignsView> createState() => _ZodiacSignsViewState();
}

class _ZodiacSignsViewState extends State<ZodiacSignsView> {
  String title = "yay";
  @override
  Widget build(BuildContext context) {
    final TabBarController tabBarController =
        Get.put(TabBarController.instance);
    final ZodiacPickerController zodiacPickerController =
        Get.put(ZodiacPickerController.instance);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Obx(() =>
              Text(Data.zodiacs[zodiacPickerController.getValue].zodiacName)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              width: context.width(1),
              height: context.height(0.16),
              child: RotatedBox(
                quarterTurns: 1,
                child: CupertinoPicker(
                  selectionOverlay:
                      const CupertinoPickerDefaultSelectionOverlay(
                    background: Colors.transparent,
                  ),
                  scrollController: FixedExtentScrollController(initialItem: 0),
                  useMagnifier: true,
                  magnification: 1.3,
                  offAxisFraction: 0.2,
                  itemExtent: context.width(0.2),
                  onSelectedItemChanged: (value) {
                    zodiacPickerController.setValue = value;
                  },
                  children:
                      Data.zodiacs.map((item) => signPicker(item)).toList(),
                ),
              ),
            ),
            buildTabBar(tabBarController),
          ],
        ),
      ),
    );
  }

  Center signPicker(ZodiacModel item) {
    return Center(
      child: RotatedBox(
        quarterTurns: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              item.path,
              scale: 2.5,
            ),
          ),
        ),
      ),
    );
  }

  TabBarWidget buildTabBar(TabBarController tabBarController) {
    return TabBarWidget(
      widgetList: [
        ExpandedItem2(
          text: "Günlük",
          clickedNumber: 0,
          tabBarController: tabBarController,
          onTap: () {
            tabBarController.setIndex = 0;
          },
        ),
        ExpandedItem2(
          text: "Haftalık",
          clickedNumber: 1,
          tabBarController: tabBarController,
          onTap: () {
            tabBarController.setIndex = 1;
          },
        ),
        ExpandedItem2(
          text: "Aylık",
          tabBarController: tabBarController,
          clickedNumber: 2,
          onTap: () {
            tabBarController.setIndex = 2;
          },
        ),
        ExpandedItem2(
          text: "Yıllık",
          clickedNumber: 3,
          tabBarController: tabBarController,
          onTap: () {
            tabBarController.setIndex = 3;
          },
        ),
      ],
    );
  }
}

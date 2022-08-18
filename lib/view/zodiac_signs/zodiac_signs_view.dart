import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

import '../../core/extension/context_extension.dart';

import '../../feature/components/custom_appbar.dart';
import '../../feature/components/custom_decoration.dart';
import '../../feature/components/tab_bar_widget.dart';
import '../../feature/data/data.dart';
import '../../feature/models/zodiac_model.dart';
import 'components/fortune_widget.dart';
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
    return Container(
      decoration: AppDecoration.scaffoldDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: Obx(
            () => Text(zodiacSignController.getChoosenSign),
          ),
        ),
        body: Padding(
          padding: context.normalPadding,
          child: Column(
            children: [
              buildCupertinoPicker,
              SizedBox(
                height: context.mediumHeight,
              ),
              buildTabBar,
              SizedBox(height: context.normalHeight),
              Expanded(
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Obx(() => fortunes),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get buildCupertinoPicker {
    return Builder(builder: (context) {
      return SizedBox(
        height: context.height(0.13),
        child: RotatedBox(
          quarterTurns: 1,
          child: CupertinoPicker(
            diameterRatio: 2,
            selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
              background: Colors.transparent,
            ),
            scrollController: FixedExtentScrollController(initialItem: 3),
            useMagnifier: true,
            magnification: 1,
            itemExtent: context.width(0.38),
            onSelectedItemChanged: (value) {
              zodiacSignController.setSign = Data.zodiacs[value].zodiacName;
              ZodiacTabController.instance.setIndex = -1;
              zodiacPickerController.setValue = value;
            },
            children: Data.zodiacs.map((item) => signPicker(item)).toList(),
          ),
        ),
      );
    });
  }

  Widget get fortunes {
    switch (tabBarController.getIndex) {
      case 0:
        return zodiacSignController.dailyFortune.value != null
            ? FortuneWidget(
                fortune: zodiacSignController.dailyFortune.value!.fortune ?? "",
                motto: zodiacSignController.dailyFortune.value!.mottosu ?? "",
                element:
                    zodiacSignController.dailyFortune.value!.elementi ?? "",
                planet: zodiacSignController.dailyFortune.value!.gezegeni ?? "",
              )
            : const Text("Burç verileri getiriliyor...");

      case 1:
        return zodiacSignController.weeklyFortune.value != null
            ? FortuneWidget(
                fortune:
                    zodiacSignController.weeklyFortune.value!.fortune ?? "",
                motto: zodiacSignController.weeklyFortune.value!.mottosu ?? "",
                element:
                    zodiacSignController.weeklyFortune.value!.elementi ?? "",
                planet:
                    zodiacSignController.weeklyFortune.value!.gezegeni ?? "",
              )
            : const Text("Burç verileri getiriliyor...");

      case 2:
        return zodiacSignController.monthlyFortune.value != null
            ? FortuneWidget(
                fortune:
                    zodiacSignController.monthlyFortune.value!.fortune ?? "",
                motto: zodiacSignController.monthlyFortune.value!.mottosu ?? "",
                element:
                    zodiacSignController.monthlyFortune.value!.elementi ?? "",
                planet:
                    zodiacSignController.monthlyFortune.value!.gezegeni ?? "",
              )
            : const Text("Burç verileri getiriliyor...");

      case 3:
        return zodiacSignController.yearlyFortune.value != null
            ? FortuneWidget(
                fortune:
                    zodiacSignController.yearlyFortune.value!.fortune ?? "",
                motto: zodiacSignController.yearlyFortune.value!.mottosu ?? "",
                element:
                    zodiacSignController.yearlyFortune.value!.elementi ?? "",
                planet:
                    zodiacSignController.yearlyFortune.value!.gezegeni ?? "",
              )
            : const Text("Burç verileri getiriliyor...");
      case 4:
        return zodiacSignController.loveFortune.value != null
            ? FortuneWidget(
                fortune: zodiacSignController.loveFortune.value!.yorum ?? "",
                motto: zodiacSignController.loveFortune.value!.baslik ?? "",
                element: "",
                planet: "",
              )
            : const Text("Burç verileri getiriliyor...");
      case 5:
        return zodiacSignController.careerFortune.value != null
            ? FortuneWidget(
                fortune: zodiacSignController.careerFortune.value!.yorum ?? "",
                motto: zodiacSignController.careerFortune.value!.baslik ?? "",
                element: "",
                planet: "",
              )
            : const Text("Burç verileri getiriliyor...");
      case 6:
        return zodiacSignController.healthFortune.value != null
            ? FortuneWidget(
                fortune: zodiacSignController.healthFortune.value!.yorum ?? "",
                motto: zodiacSignController.healthFortune.value!.baslik ?? "",
                element: "",
                planet: "",
              )
            : const Text("Burç verileri getiriliyor...");

      default:
        return const Center(
            child: AutoSizeText(
          "Sonuçları görmek için lütfen zaman dilimi seçiniz.",
          maxLines: 1,
        ));
    }
  }

  Center signPicker(ZodiacModel item) {
    return Center(
      child: RotatedBox(
        quarterTurns: 3,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(0.4),
          ),
          child: Padding(
            padding: context.lowPadding,
            child: Image.asset(
              item.path,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }

  TabBarWidget get buildTabBar {
    return TabBarWidget(
      widgetList: [
        ExpandedItem2(
          text: "Günlük",
          clickedNumber: 0,
          tabBarController: tabBarController,
          onTap: () async {
            tabBarController.setIndex = 0;

            await zodiacSignController
                .getDailyFortune(zodiacSignController.getChoosenSign);
          },
        ),
        ExpandedItem2(
          text: "Haftalık",
          clickedNumber: 1,
          tabBarController: tabBarController,
          onTap: () async {
            tabBarController.setIndex = 1;
            await zodiacSignController
                .getWeeklyFortune(zodiacSignController.getChoosenSign);
          },
        ),
        ExpandedItem2(
          text: "Aylık",
          tabBarController: tabBarController,
          clickedNumber: 2,
          onTap: () async {
            tabBarController.setIndex = 2;
            await zodiacSignController
                .getMonthlyFortune(zodiacSignController.getChoosenSign);
          },
        ),
        ExpandedItem2(
          text: "Yıllık",
          clickedNumber: 3,
          tabBarController: tabBarController,
          onTap: () async {
            tabBarController.setIndex = 3;
            await zodiacSignController
                .getYearlyFortune(zodiacSignController.getChoosenSign);
          },
        ),
        ExpandedItem2(
          text: "Aşk",
          clickedNumber: 4,
          tabBarController: tabBarController,
          onTap: () async {
            tabBarController.setIndex = 4;
            await zodiacSignController
                .getLoveFortune(zodiacSignController.getChoosenSign);
          },
        ),
        ExpandedItem2(
          text: "Kariyer",
          clickedNumber: 5,
          tabBarController: tabBarController,
          onTap: () async {
            tabBarController.setIndex = 5;
            await zodiacSignController
                .getCareerFortune(zodiacSignController.getChoosenSign);
          },
        ),
        ExpandedItem2(
          text: "Sağlık",
          clickedNumber: 6,
          tabBarController: tabBarController,
          onTap: () async {
            tabBarController.setIndex = 6;
            await zodiacSignController
                .getHealthFortune(zodiacSignController.getChoosenSign);
          },
        ),
      ],
    );
  }
}

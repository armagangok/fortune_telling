import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../core/components/custom_appbar.dart';
import '../../../core/components/custom_decoration.dart';
import '../../../core/components/tab_bar_widget.dart';
import '../../../core/extension/context_extension.dart';
import '../../../data/fortune_data.dart';
import '../../../data/models/zodiac_model.dart';
import '../../../injection_container.dart';
import '../components/fortune_widget.dart';
import '../controller/zodiac_picker_controller.dart';
import '../controller/zodiac_sign_controller.dart';
import '../controller/zodiac_tab_controller.dart';

class ZodiacSignsView extends StatelessWidget {
  ZodiacSignsView({Key? key}) : super(key: key);

  final zodiacTabController = getIt.call<ZodiacTabController>();
  final zodiacPickerController = getIt.call<ZodiacPickerController>();
  final zodiacSignController = getIt.call<ZodiacSignController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.scaffoldDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: Obx(
            () => Text(
              zodiacPickerController.choosenSign.value,
              style: context.textTheme.headline4!.copyWith(color: Colors.white),
            ),
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
              zodiacPickerController.setSign =
                  FortuneData.zodiacs[value].zodiacName;
              zodiacTabController.setIndex = -1;
              zodiacPickerController.setValue = value;
            },
            children:
                FortuneData.zodiacs.map((item) => signPicker(item)).toList(),
          ),
        ),
      );
    });
  }

  Widget get fortunes {
    switch (zodiacTabController.getIndex) {
      case 0:
        return zodiacSignController.fortuneModel.value != null
            ? FortuneWidget(
                fortune: zodiacSignController.fortuneModel.value!.fortune ?? "",
                motto: zodiacSignController.fortuneModel.value!.mottosu ?? "",
                element:
                    zodiacSignController.fortuneModel.value!.elementi ?? "",
                planet: zodiacSignController.fortuneModel.value!.gezegeni ?? "",
              )
            : _loadingText();

      case 1:
        return zodiacSignController.fortuneModel.value != null
            ? FortuneWidget(
                fortune: zodiacSignController.fortuneModel.value!.fortune ?? "",
                motto: zodiacSignController.fortuneModel.value!.mottosu ?? "",
                element:
                    zodiacSignController.fortuneModel.value!.elementi ?? "",
                planet: zodiacSignController.fortuneModel.value!.gezegeni ?? "",
              )
            : _loadingText();

      case 2:
        return zodiacSignController.fortuneModel.value != null
            ? FortuneWidget(
                fortune: zodiacSignController.fortuneModel.value!.fortune ?? "",
                motto: zodiacSignController.fortuneModel.value!.mottosu ?? "",
                element:
                    zodiacSignController.fortuneModel.value!.elementi ?? "",
                planet: zodiacSignController.fortuneModel.value!.gezegeni ?? "",
              )
            : _loadingText();

      case 3:
        return zodiacSignController.fortuneModel.value != null
            ? FortuneWidget(
                fortune: zodiacSignController.fortuneModel.value!.fortune ?? "",
                motto: zodiacSignController.fortuneModel.value!.mottosu ?? "",
                element:
                    zodiacSignController.fortuneModel.value!.elementi ?? "",
                planet: zodiacSignController.fortuneModel.value!.gezegeni ?? "",
              )
            : _loadingText();
      case 4:
        return zodiacSignController.fortuneModel.value != null
            ? FortuneWidget(
                fortune: zodiacSignController.fortuneModel.value!.yorum ?? "",
                motto: zodiacSignController.fortuneModel.value!.baslik ?? "",
                element: "",
                planet: "",
              )
            : _loadingText();
      case 5:
        return zodiacSignController.fortuneModel.value != null
            ? FortuneWidget(
                fortune: zodiacSignController.fortuneModel.value!.yorum ?? "",
                motto: zodiacSignController.fortuneModel.value!.baslik ?? "",
                element: "",
                planet: "",
              )
            : _loadingText();
      case 6:
        return zodiacSignController.fortuneModel.value != null
            ? FortuneWidget(
                fortune: zodiacSignController.fortuneModel.value!.yorum ?? "",
                motto: zodiacSignController.fortuneModel.value!.baslik ?? "",
                element: "",
                planet: "",
              )
            : _loadingText();

      default:
        return const Center(
            child: AutoSizeText(
          "Sonuçları görmek için lütfen kategori seçiniz.",
          maxLines: 1,
        ));
    }
  }

  Widget _loadingText() =>
      const Center(child: Text("Burç verileri getiriliyor..."));

  Widget signPicker(ZodiacModel item) {
    return Center(
      child: RotatedBox(
        quarterTurns: 3,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(0.4),
          ),
          child: Builder(builder: (context) {
            return Padding(
              padding: context.lowPadding,
              child: Image.asset(
                item.path,
                fit: BoxFit.fitHeight,
              ),
            );
          }),
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
          tabBarController: zodiacTabController,
          onTap: () async {
            zodiacTabController.setIndex = 0;

            await zodiacSignController
                .getDailyFortune(zodiacPickerController.choosenSign.value);
          },
        ),
        ExpandedItem2(
          text: "Haftalık",
          clickedNumber: 1,
          tabBarController: zodiacTabController,
          onTap: () async {
            zodiacTabController.setIndex = 1;
            await zodiacSignController
                .getFortune(zodiacPickerController.choosenSign.value);
          },
        ),
        ExpandedItem2(
          text: "Aylık",
          tabBarController: zodiacTabController,
          clickedNumber: 2,
          onTap: () async {
            zodiacTabController.setIndex = 2;
            await zodiacSignController
                .getFortune(zodiacPickerController.choosenSign.value);
          },
        ),
        ExpandedItem2(
          text: "Yıllık",
          clickedNumber: 3,
          tabBarController: zodiacTabController,
          onTap: () async {
            zodiacTabController.setIndex = 3;
            await zodiacSignController
                .getFortune(zodiacPickerController.choosenSign.value);
          },
        ),
        ExpandedItem2(
          text: "Aşk",
          clickedNumber: 4,
          tabBarController: zodiacTabController,
          onTap: () async {
            zodiacTabController.setIndex = 4;
            await zodiacSignController
                .getFortune(zodiacPickerController.choosenSign.value);
          },
        ),
        ExpandedItem2(
          text: "Kariyer",
          clickedNumber: 5,
          tabBarController: zodiacTabController,
          onTap: () async {
            zodiacTabController.setIndex = 5;
            await zodiacSignController
                .getFortune(zodiacPickerController.choosenSign.value);
          },
        ),
        ExpandedItem2(
          text: "Sağlık",
          clickedNumber: 6,
          tabBarController: zodiacTabController,
          onTap: () async {
            zodiacTabController.setIndex = 6;
            await zodiacSignController
                .getFortune(zodiacPickerController.choosenSign.value);
          },
        ),
      ],
    );
  }
}

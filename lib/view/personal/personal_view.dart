import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortune_telling/core/constants/app_color.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

import '../../core/constants/asset_constant.dart';
import '../../core/extension/context_extension.dart';
import '../../core/padding/project_padding.dart';
import '../../feature/components/custom_appbar.dart';
import '../../feature/components/custom_decoration.dart';
import '../../feature/components/tab_bar_widget.dart';
import '../login/controller/zodiac_controller.dart';
import 'controller/sign_controller.dart';
import 'controller/tab_controller.dart';

class PersonalView extends StatelessWidget {
  PersonalView({Key? key}) : super(key: key);

  final SignController _personalController = Get.put(SignController.instance);
  final TabBarController _tabBarController = Get.put(TabBarController.instance);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.scaffoldDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(
          title: Text("Bana Özel"),
        ),
        body: Obx(
          () => _personalController.dailyFortune.value != null
              ? ListView(
                  padding: const ListviewPadding.all(),
                  children: [
                    userNametext,
                    heigth025,
                    zoidacImage,
                    zodiacSignText,
                    heigth025,
                    Center(
                      child: TabBarWidget(
                        widgetList: widgetList,
                      ),
                    ),
                    heigth015,
                    fortunes,
                  ],
                )
              : loadingWidget,
        ),
      ),
    );
  }

  Column get fortunes => Column(
        children: [
          _tabBarController.getIndex == 0
              ? cardWidget(
                  _personalController.dailyFortune.value?.fortune ?? "",
                )
              : const Center(),
          _tabBarController.getIndex == 1
              ? cardWidget(
                  _personalController.loveFortune.value?.yorum ?? "",
                )
              : const Center(),
          _tabBarController.getIndex == 2
              ? cardWidget(
                  _personalController.healthFortune.value?.yorum ?? "",
                )
              : const Center(),
          _tabBarController.getIndex == 3
              ? cardWidget(
                  _personalController.careerFortune.value?.yorum ?? "",
                )
              : const Center(),
        ],
      );

  Widget get loadingWidget => const Center(
        child: Text(
          "Burç verileriniz yükleniyor. Lütfen bekleyiniz...",
        ),
      );

  //

  Widget cardWidget(text) {
    return Builder(builder: (context) {
      return Card(
        color: AppColor.cardColor.withOpacity(0.5),
        child: Padding(
          padding: const NormalPadding.all(),
          child: Text(text),
        ),
      );
    });
  }

  //

  Widget get heigth025 => Builder(
        builder: (context) {
          return SizedBox(
            height: context.normalHeight,
          );
        },
      );

  //
  Widget get heigth015 => Builder(
        builder: (context) {
          return SizedBox(
            height: context.lowHeight,
          );
        },
      );
  //

  Decoration get decoration => const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(KAsset.backgroundImage),
          fit: BoxFit.fill,
        ),
      );

  //

  Text get fortuneText =>
      Text(_personalController.dailyFortune.value!.fortune!);

  //

  Widget get userNametext => Builder(
        builder: (context) {
          return AutoSizeText(
            "Merhaba ${_personalController.userName.value!.toUpperCase()} senin için özel bir yorum hazırladık!",
            style: context.textTheme.bodyMedium,
            maxLines: 1,
            minFontSize: 10,
          );
        },
      );

  //

  Widget get zodiacSignText => Builder(
        builder: (context) {
          return Text(
            _personalController.dailyFortune.value!.burc!,
            textAlign: TextAlign.center,
            style: context.textTheme.headline3,
          );
        },
      );

  //

  Widget get zoidacImage => Builder(
        builder: (context) {
          return SizedBox(
            height: context.height(0.25),
            child: Image.asset(
              ZodiacController.instance.getSignImagePath(
                _personalController.dailyFortune.value!.burc!,
              ),
            ),
          );
        },
      );

  //

  List<Widget> get widgetList => [
        ExpandedItem(
          text: "Genel",
          clickedNumber: 0,
          iconData: CupertinoIcons.person_fill,
          tabControler: _tabBarController,
          onTap: () => _tabBarController.setIndex = 0,
        ),
        ExpandedItem(
          text: "Aşk",
          clickedNumber: 1,
          iconData: CupertinoIcons.heart_fill,
          tabControler: _tabBarController,
          onTap: () => _tabBarController.setIndex = 1,
        ),
        ExpandedItem(
          text: "Sağlık",
          clickedNumber: 2,
          iconData: Icons.monitor_heart_outlined,
          tabControler: _tabBarController,
          onTap: () => _tabBarController.setIndex = 2,
        ),
        ExpandedItem(
          text: "Kariyer",
          clickedNumber: 3,
          iconData: CupertinoIcons.money_dollar,
          tabControler: _tabBarController,
          onTap: () => _tabBarController.setIndex = 3,
        ),
      ];
}

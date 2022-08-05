import 'package:flutter/material.dart';
import 'package:fortune_telling/feature/controllers/tab_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

import '../../core/constants/asset_constant.dart';
import '../../core/extension/context_extension.dart';
import '../../feature/components/tab_bar_widget.dart';
import '../login/controller/zodiac_controller.dart';
import 'controller/personal_controller.dart';

class PersonalView extends StatelessWidget {
  PersonalView({Key? key}) : super(key: key);

  final PersonalController _personalController =
      Get.put(PersonalController.instance);

  final TabBarController _tabBarController = Get.put(TabBarController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: decoration,
          child: Obx(
            () => _personalController.dailyFortune.value != null
                ? ListView(
                    padding: context.symmetric(
                      horizontal: 0.05,
                      vertical: 0.025,
                    ),
                    children: [
                      zoidacImage,
                      zodiacSignText,
                      userNametext,
                      heigth005,
                      Center(child: MyTabBar()),
                      _tabBarController.currentIndex.value == 0
                          ? fortuneText
                          : const Center(),
                      _tabBarController.currentIndex.value == 1
                          ? const Text("Aşk yorumu yüklenecek")
                          : const Center(),
                      _tabBarController.currentIndex.value == 2
                          ? const Text("SağlıkAşk yorumu yüklenecek")
                          : const Center(),
                    ],
                  )
                : const Center(
                    child: Text(
                      "Burç verileriniz yükleniyor. Lütfen bekleyiniz...",
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget get heigth005 => Builder(
        builder: (context) {
          return SizedBox(
            height: context.height(0.05),
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

  Text get userNametext => Text(
        "Merhaba ${_personalController.userName.value!} senin için çok özel bir burç yorumu hazırladık!",
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
            height: context.height(0.15),
            child: Image.asset(
              ZodiacController.instance.getZodiacSignImagePath(
                _personalController.dailyFortune.value!.burc!,
              ),
            ),
          );
        },
      );
}

import 'package:flutter/material.dart';
import 'package:fortune_telling/core/components/blinking_button.dart';
import 'package:get/route_manager.dart';
import '../../../core/constants/asset_constant.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/navigation/app_pages.dart';
import '../../../core/components/custom_decoration.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: AppDecoration.scaffoldDecoration,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 3),
                Image.asset(KAsset.saturn, scale: 5),
                SizedBox(
                  width: context.width(0.7),
                  height: context.height(0.4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyBlinkingButton(
                          onTap: () => Get.toNamed(Routes.PERSONAL),
                          text: "Bana Özel"),
                      SizedBox(height: context.normalHeight),
                      MyBlinkingButton(
                          onTap: () => Get.toNamed(Routes.FIND),
                          text: "Burcumu Bul"),
                      SizedBox(height: context.height(0.025)),
                      MyBlinkingButton(
                          onTap: () => Get.toNamed(Routes.ZODIAC_SIGN),
                          text: "Tüm Burçlar"),
                      const Spacer(),
                    ],
                  ),
                ),
                const Spacer(flex: 3)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

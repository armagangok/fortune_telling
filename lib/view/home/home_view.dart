import 'package:flutter/material.dart';
import 'package:fortune_telling/core/extension/context_extension.dart';
import 'package:fortune_telling/core/navigation/app_pages.dart';
import 'package:fortune_telling/feature/components/custom_button.dart';
import 'package:fortune_telling/feature/components/custom_decoration.dart';
import 'package:get/route_manager.dart';

import '../../core/constants/asset_constant.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    CustomButton(
                        onTap: () => Get.toNamed(Routes.PERSONAL),
                        text: "Bana Özel"),
                    SizedBox(height: context.height(0.025)),
                    CustomButton(
                        onTap: () => Get.toNamed(Routes.FIND),
                        text: "Burcumu Bul"),
                    SizedBox(height: context.height(0.025)),
                    CustomButton(
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
    );
  }

  Widget _container(TextButton textButton) {
    return Builder(builder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30)),
        height: context.height(0.1),
        width: context.width(0.65),
        child: textButton,
      );
    });
  }

  EdgeInsets padding(BuildContext context) {
    return EdgeInsets.all(context.width(0.05));
  }

  RoundedRectangleBorder shape() =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(16));

  Widget text(String text) {
    return Builder(
      builder: (context) {
        return Text(
          text,
          style: context.textTheme.headline4!.copyWith(
            color: Colors.white,
          ),
        );
      },
    );
  }
}

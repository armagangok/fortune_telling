import 'package:flutter/material.dart';

import '../../../core/components/blinking_button.dart';
import '../../../core/components/custom_decoration.dart';
import '../../../core/constants/asset_constant.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/navigation/constant/routes.dart';
import '../../../core/navigation/contract/base_navigation_service.dart';
import '../../../injection_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _navigator = getIt.call<NavigationServiceContract>();
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
                          onTap: () =>
                              _navigator.navigateTo(path: KRoute.PERSONAL_PAGE),
                          text: "Bana Özel"),
                      SizedBox(height: context.normalHeight),
                      MyBlinkingButton(
                          onTap: () => _navigator.navigateTo(path: KRoute.FIND),
                          text: "Burcumu Bul"),
                      SizedBox(height: context.height(0.025)),
                      MyBlinkingButton(
                          onTap: () => _navigator.navigateTo(
                              path: KRoute.ZODIAC_SIGN_PAGE),
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

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../../core/constants/asset_constant.dart';
import '../../../core/extension/context_extension.dart';
import '../controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);

  final SplashController splashController = Get.put(SplashController.instance);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: context.dynamicHeight,
              child: Image.asset(
                KAsset.backgroundImage,
                fit: BoxFit.fill,
              ),
            ),
            Center(child: Image.asset(KAsset.splashImage)),
          ],
        ),
      ),
    );
  }
}

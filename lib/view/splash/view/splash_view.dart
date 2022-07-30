import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../../core/extension/context_extension.dart';
import '../controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);

  final SplashController splashController = Get.put(SplashController.instance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: context.height(1),
        child: Image.asset(
          'assets/fortune.jpg',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

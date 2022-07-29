import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../../core/extension/context_extension.dart';
import '../controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();
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

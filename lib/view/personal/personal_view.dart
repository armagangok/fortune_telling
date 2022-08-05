import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

import '../../core/constants/asset_constant.dart';
import '../../core/extension/context_extension.dart';
import '../login/controller/zodiac_controller.dart';
import 'controller/personal_controller.dart';

class PersonalView extends StatelessWidget {
  PersonalView({Key? key}) : super(key: key);

  final PersonalController _personalController =
      Get.put(PersonalController.instance);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: decoration,
          child: Obx(
            () => _personalController.dailyFortune.value != null
                ? ListView(
                    children: [
                      zoidacImage(),
                      zodiacSignText(),
                      useNametext(),
                      fortuneText,
                    ],
                  )
                : const Center(
                    child: Text(
                        "Burç verileriniz yükleniyor. Lütfen bekleyiniz..."),
                  ),
          ),
        ),
      ),
    );
  }

  Decoration get decoration => const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(KAsset.backgroundImage),
          fit: BoxFit.fill,
        ),
      );

  Text get fortuneText =>
      Text(_personalController.dailyFortune.value!.fortune!);

  Text useNametext() {
    return Text(_personalController.userName.value!);
  }

  Widget zodiacSignText() {
    return Builder(builder: (context) {
      return Text(
        _personalController.dailyFortune.value!.burc!,
        textAlign: TextAlign.center,
        style: context.textTheme.headline3,
      );
    });
  }

  Widget zoidacImage() {
    return Builder(builder: (context) {
      return SizedBox(
        height: context.height(0.15),
        child: Image.asset(
          ZodiacController.instance.getZodiacSignImagePath(
            _personalController.dailyFortune.value!.burc!,
          ),
        ),
      );
    });
  }
}

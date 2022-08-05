import 'package:flutter/material.dart';
import 'package:fortune_telling/core/constants/asset_constant.dart';
import 'package:fortune_telling/core/extension/context_extension.dart';
import 'package:fortune_telling/view/login/controller/zodiac_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

import 'controller/personal_controller.dart';

class PersonalView extends StatelessWidget {
  PersonalView({Key? key}) : super(key: key);

  final PersonalController _personalController =
      Get.put(PersonalController.instance);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        // ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(KAsset.backgroundImage),
              fit: BoxFit.fill,
            ),
          ),
          child: Obx(
            () => _personalController.dailyFortune.value != null
                ? ListView(
                    children: [
                      SizedBox(
                        height: context.height(0.15),
                        child: Image.asset(
                          ZodiacController.instance.getZodiacSignImagePath(
                            _personalController.dailyFortune.value!.burc!,
                          ),
                        ),
                      ),
                      Text(
                        _personalController.dailyFortune.value!.burc!,
                        textAlign: TextAlign.center,
                        style: context.textTheme.headline3,
                      ),
                      Text(_personalController.userName.value!),
                      Text(_personalController.dailyFortune.value!.fortune!),
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
}

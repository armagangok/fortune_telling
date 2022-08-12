import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:fortune_telling/core/padding/project_padding.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import '../../../core/constants/asset_constant.dart';
import '../../../core/extension/context_extension.dart';
import '../../login/controller/zodiac_controller.dart';
import '../controller/find_zodiac_controller.dart';

class FindZodiacView extends StatelessWidget {
  FindZodiacView({Key? key}) : super(key: key);

  final FindZodiacController findZodiacController =
      Get.put(FindZodiacController.instance);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(KAsset.backgroundImage),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const HighPadding.all(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appbar(),
          body: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  findZodiacController.val1.value == ""
                      ? birthdayPicker()
                      : zoidacSignText(),
                  SizedBox(
                    height: context.height(0.02),
                  ),
                  findZodiacController.val1.value == ""
                      ? _findZodiacButton()
                      : zodiacSingImage(),
                  findZodiacController.val1.value != ""
                      ? SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              findZodiacController.val1.value = "";
                            },
                            child: const Text("Başka Bul"),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 10),
                ],
              )),
        ),
      ),
    );
  }

  Obx zodiacSingImage() {
    return Obx(() => findZodiacController.val1.value != ""
        ? Image.asset(findZodiacController.val1.value)
        : const Center());
  }

  Widget zoidacSignText() => Builder(
        builder: (context) {
          return Obx(
            () => Text(
              findZodiacController.val.value,
              style: context.textTheme.headline2!.copyWith(
                color: Colors.white,
              ),
            ),
          );
        },
      );

  AppBar appbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  DateTimePicker birthdayPicker() {
    return DateTimePicker(
      initialValue: '',
      firstDate: DateTime(1960),
      lastDate: DateTime(2023),
      dateLabelText: 'Date',
      onChanged: (val) {
        findZodiacController.setBirthdayValue = val;
      },
    );
  }

  Widget _findZodiacButton() {
    return Builder(builder: (context) {
      return SizedBox(
        width: context.width(1),
        child: ElevatedButton(
          onPressed: () async {
            findZodiacController.val.value = ZodiacController.instance
                .getZodicaSign(
                    DateTime.parse(findZodiacController.getBirthday));
            findZodiacController.val1.value = ZodiacController.instance
                .getSignImagePath(findZodiacController.val.value);
          },
          child: const Text("Burcumu Bul"),
        ),
      );
    });
  }
}

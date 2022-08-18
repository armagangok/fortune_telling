import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import '../../../core/extension/context_extension.dart';
import '../../../feature/components/custom_appbar.dart';
import '../../../feature/components/custom_button.dart';
import '../../../feature/components/custom_decoration.dart';
import '../../login/controller/zodiac_controller.dart';
import '../controller/find_zodiac_controller.dart';

class FindZodiacView extends StatelessWidget {
  FindZodiacView({Key? key}) : super(key: key);

  final FindZodiacController findZodiacController =
      Get.put(FindZodiacController.instance);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.scaffoldDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: const Text("Burcumu Bul"),
          onTap: () {
            findZodiacController.val1.value = "";
            Get.back();
          },
        ),
        body: Padding(
          padding: context.bigPadding,
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                findZodiacController.val1.value == ""
                    ? _dateTimePicker()
                    : _zodiacText(context),
                SizedBox(height: context.normalHeight),
                findZodiacController.val1.value == ""
                    ? _findButton()
                    : _zodiacImage(),
                findZodiacController.val1.value != ""
                    ? _findAnotherZodiacButton()
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CustomButton _findAnotherZodiacButton() {
    return CustomButton(
      text: "Başka Burç Ara",
      onTap: () {
        findZodiacController.setBirthdayValue = "";
        findZodiacController.val1.value = "";
      },
    );
  }

  Obx _zodiacImage() {
    return Obx(
      () => findZodiacController.val1.value != ""
          ? Image.asset(findZodiacController.val1.value)
          : const Center(),
    );
  }

  CustomButton _findButton() {
    return CustomButton(
        onTap: () {
          findZodiacController.getBirthday == ""
              ? Get.snackbar("Uyarı", "Lütfen tarih giriniz")
              : {
                  findZodiacController.val.value = ZodiacController.instance
                      .getZodicaSign(
                          DateTime.parse(findZodiacController.getBirthday)),
                  findZodiacController.val1.value = ZodiacController.instance
                      .getSignImagePath(findZodiacController.val.value),
                };
        },
        text: "Burcumu Bul");
  }

  Obx _zodiacText(BuildContext context) {
    return Obx(
      () => Text(
        findZodiacController.val.value,
        style: context.textTheme.headline2!.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }

  DateTimePicker _dateTimePicker() {
    return DateTimePicker(
      decoration: AppDecoration.decoration("Doğum Tarihiniz"),
      initialValue: '',
      firstDate: DateTime(1960),
      lastDate: DateTime(2023),
      dateLabelText: 'Date',
      onChanged: (val) {
        findZodiacController.setBirthdayValue = val;
      },
    );
  }
}

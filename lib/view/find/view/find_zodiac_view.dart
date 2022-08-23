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
            findZodiacController.birtthDay.value = "";
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
                findZodiacController.birtthDayPath.value == ""
                    ? _dateTimePicker()
                    : _zodiacText(context),
                SizedBox(height: context.normalHeight),
                findZodiacController.birtthDayPath.value == ""
                    ? _findButton()
                    : _zodiacImage(),
                findZodiacController.birtthDayPath.value != ""
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
        findZodiacController.birtthDay.value = "";
        findZodiacController.birtthDayPath.value = "";
      },
    );
  }

  Obx _zodiacImage() {
    return Obx(
      () => findZodiacController.birtthDayPath.value != ""
          ? Image.asset(findZodiacController.birtthDayPath.value)
          : const Center(),
    );
  }

  CustomButton _findButton() {
    return CustomButton(
        onTap: () {
          findZodiacController.birtthDay.value == ""
              ? Get.snackbar("Uyarı", "Lütfen tarih giriniz")
              : {
                  findZodiacController.birtthDay.value =
                      ZodiacController.instance.getZodicaSign(
                          DateTime.parse(findZodiacController.birtthDay.value)),
                  findZodiacController.birtthDayPath.value = ZodiacController
                      .instance
                      .getSignImagePath(findZodiacController.birtthDay.value),
                };
        },
        text: "Burcumu Bul");
  }

  Obx _zodiacText(BuildContext context) {
    return Obx(
      () => Text(
        findZodiacController.birtthDay.value,
        style: context.textTheme.headline2!.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }

  DateTimePicker _dateTimePicker() {
    return DateTimePicker(
      decoration: AppDecoration.decoration(hinttext: "Doğum Tarihiniz"),
      initialValue: '',
      firstDate: DateTime(1960),
      lastDate: DateTime(2023),
      dateLabelText: 'Date',
      onChanged: (val) {
        findZodiacController.birtthDay.value = val;
      },
    );
  }
}

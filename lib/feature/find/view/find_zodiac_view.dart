import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:fortune_telling/injection_container.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import '../../../core/extension/context_extension.dart';
import '../../../core/components/blinking_button.dart';
import '../../../core/components/custom_appbar.dart';
import '../../../core/components/custom_decoration.dart';
import '../../login/controller/zodiac_controller.dart';
import '../controller/find_zodiac_controller.dart';

class FindZodiacView extends StatelessWidget {
  FindZodiacView({Key? key}) : super(key: key);

  final findZodiacController = getIt.call<FindZodiacController>();
  final zodiacController = getIt.call<ZodiacController>();

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
                    ? _dateTimePicker
                    : _zodiacText,
                SizedBox(height: context.normalHeight),
                findZodiacController.birtthDayPath.value == ""
                    ? _findButton
                    : _zodiacImage,
                findZodiacController.birtthDayPath.value != ""
                    ? _findAnotherZodiacButton
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  MyBlinkingButton get _findAnotherZodiacButton => MyBlinkingButton(
        text: "Başka Burç Ara",
        onTap: () {
          findZodiacController.birtthDay.value = "";
          findZodiacController.birtthDayPath.value = "";
        },
      );

  Obx get _zodiacImage => Obx(
        () => findZodiacController.birtthDayPath.value != ""
            ? Image.asset(findZodiacController.birtthDayPath.value)
            : const Center(),
      );

  MyBlinkingButton get _findButton => MyBlinkingButton(
      onTap: () {
        findZodiacController.birtthDay.value == ""
            ? Get.snackbar("Uyarı", "Lütfen tarih giriniz")
            : {
                findZodiacController.birtthDay.value =
                    zodiacController.getZodicaSign(
                        DateTime.parse(findZodiacController.birtthDay.value)),
                findZodiacController.birtthDayPath.value = zodiacController
                    .getSignImagePath(findZodiacController.birtthDay.value),
              };
      },
      text: "Burcumu Bul");

  Widget get _zodiacText => Obx(
        () => Builder(builder: (context) {
          return Text(
            findZodiacController.birtthDay.value,
            style: context.textTheme.headline2!.copyWith(
              color: Colors.white,
            ),
          );
        }),
      );

  Widget get _dateTimePicker => Builder(
      builder: (context) => SizedBox(
            height: context.height(0.09),
            child: DateTimePicker(
              decoration: AppDecoration.decoration(
                hinttext: "Doğum Tarihiniz",
                height: context.height(0.09),
              ),
              initialValue: '',
              firstDate: DateTime(1960),
              lastDate: DateTime(2023),
              dateLabelText: 'Doğum Tarihiniz',
              onChanged: (val) async {
                findZodiacController.birtthDay.value = val;
              },
            ),
          ));
}

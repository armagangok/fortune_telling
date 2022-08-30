import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

import '../../../core/database/local/my_storage.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/navigation/app_pages.dart';
import '../../../feature/components/blinking_button.dart';
import '../../../feature/components/custom_decoration.dart';
import '../controller/text_controller.dart';
import '../controller/zodiac_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _myStorage = Get.find<MyStorage>();
  final textController = Get.find<TextController>();
  final zodiacController = Get.find<ZodiacController>();
  String _val = "";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => context.dismissKeyboard(),
        child: Container(
          padding: context.bigPadding,
          decoration: AppDecoration.scaffoldDecoration,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _nameTextField,
                  SizedBox(height: context.normalHeight),
                  _dateTimePicker,
                  SizedBox(height: context.normalHeight),
                  _continueButton,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  MyBlinkingButton get _continueButton => MyBlinkingButton(
      text: "Devam Et",
      onTap: () async {
        final String isim = textController.usernameController.text;
        if (isim.isNotEmpty && _val.isNotEmpty) {
          await _myStorage.storage.write('isim', isim);
          await _myStorage.storage.write('isLogged', true);
          Get.toNamed(Routes.HOME);
        } else {
          Get.snackbar(
            "Hata",
            "İsminizi ve Doğum Tarihinizi Giriniz",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      });

  Widget get _nameTextField => Builder(
      builder: (context) => SizedBox(
            height: context.height(0.09),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              controller: textController.usernameController,
              decoration: AppDecoration.decoration(
                hinttext: "İsminiz",
                height: context.height(0.09),
              ),
            ),
          ));

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
                _val = val;
                await _myStorage.storage.write(
                  "birthDay",
                  val,
                );
              },
            ),
          ));
}

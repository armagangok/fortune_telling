import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

import '../../../core/database/local/my_storage.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/navigation/app_pages.dart';
import '../../../feature/components/custom_button.dart';
import '../../../feature/components/custom_decoration.dart';
import '../controller/text_controller.dart';
import '../controller/zodiac_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final MyStorage _myStorage = MyStorage.instance;
  final TextController textController = Get.put(TextController.instance);
  final ZodiacController zodiacController = Get.put(ZodiacController.instance);
  String _val = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                SizedBox(
                  height: context.height(0.1),
                  child: TextField(
                    controller: textController.usernameController,
                    decoration: AppDecoration.decoration("İsminiz"),
                  ),
                ),
                SizedBox(height: context.normalHeight),
                SizedBox(
                  height: context.height(0.1),
                  child: _dateTimePicker(),
                ),
                SizedBox(height: context.normalHeight),
                CustomButton(
                  text: "Devam Et",
                  onTap: _continuneButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _continuneButton() async {
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
  }

  Widget _dateTimePicker() {
    return DateTimePicker(
      decoration: AppDecoration.decoration("Doğum Tarihiniz"),
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
    );
  }
}

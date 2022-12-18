import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:fortune_telling/core/database/local/contract/storage_contract.dart';
import 'package:fortune_telling/core/navigation/constant/routes.dart';
import 'package:fortune_telling/core/navigation/contract/base_navigation_service.dart';
import 'package:fortune_telling/injection_container.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

import '../../../core/extension/context_extension.dart';

import '../../../core/components/blinking_button.dart';
import '../../../core/components/custom_decoration.dart';
import '../controller/text_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  String _val = "";

  final _storage = getIt.call<StorageContract>();
  final _textController = getIt.call<TextController>();
  final _navigator = getIt.call<NavigationServiceContract>();

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
        final String isim = _textController.usernameController.text;
        if (isim.isNotEmpty && _val.isNotEmpty) {
          await _storage.write('isim', isim);
          await _storage.write('isLogged', true);
          _navigator.navigateTo(path: KRoute.HOME);
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
              controller: _textController.usernameController,
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
              await _storage.write(
                "birthDay",
                val,
              );
            },
          ),
        ),
      );
}

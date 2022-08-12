import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortune_telling/core/constants/app_color.dart';
import 'package:fortune_telling/core/constants/asset_constant.dart';
import 'package:fortune_telling/core/navigation/app_pages.dart';
import 'package:fortune_telling/core/padding/project_padding.dart';
import 'package:fortune_telling/feature/components/custom_decoration.dart';
import 'package:fortune_telling/feature/components/custom_eleveted_button.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/database/local/my_storage.dart';
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
        padding: const HighPadding.all(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(KAsset.backgroundImage), fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: context.height(0.1),
                    child: TextField(
                      controller: textController.usernameController,
                      decoration: CustomDecoration.decoration("Devam Et"),
                    ),
                  ),
                  SizedBox(height: context.height(0.03)),
                  SizedBox(
                      height: context.height(0.1), child: _dateTimePicker()),
                  SizedBox(height: context.height(0.02)),
                  SizedBox(
                      height: context.height(0.09),
                      child: CustomElevetedButton(
                        text: "Devam Et",
                        onTap: _continuneButton,
                      )),
                ],
              ),
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
      decoration: CustomDecoration.decoration("Doğum Tarihiniz"),
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

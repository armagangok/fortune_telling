import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:fortune_telling/core/navigation/app_pages.dart';
import 'package:fortune_telling/core/utils/logger.dart';
import 'package:get/get.dart';

import '../../../core/database/local/my_storage.dart';
import '../../../core/extension/context_extension.dart';
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
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  controller: textController.usernameController,
                  decoration:
                      const InputDecoration(hintText: "İsminizi Giriniz")),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              DateTimePicker(
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
              ElevatedButton(
                  onPressed: () async {
                    final String isim = textController.usernameController.text;
                    if (isim.isNotEmpty && _val.isNotEmpty) {
                      await _myStorage.storage.write('isim', isim);
                      await _myStorage.storage.write('isLogged', true);
                      print(_myStorage.storage.read("isLogged"));
                      Get.toNamed(Routes.HOME);
                    } else {
                      Get.snackbar(
                        "Hata",
                        "İsminizi ve Doğum Tarihinizi Giriniz",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                  child: const Text("Giriş Yap")),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

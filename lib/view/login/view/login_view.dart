import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
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
              const Text("name"),
              TextField(controller: textController.usernameController),
              const SizedBox(height: 10),
              const Text("surname"),
              TextField(controller: textController.passwordController),
              const SizedBox(height: 10),
              DateTimePicker(
                initialValue: '',
                firstDate: DateTime(1960),
                lastDate: DateTime(2023),
                dateLabelText: 'Date',
                onChanged: (val) async {
                  await _myStorage.storage.write(
                    "birthDay",
                    val,
                  );

                  print(_myStorage.storage.read("birthDay"));
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    final String isim = textController.usernameController.text;
                    final String soyisim =
                        textController.passwordController.text;

                    if (isim.isNotEmpty || soyisim.isNotEmpty) {
                      await _myStorage.storage.write('isLogged', true);
                      await _myStorage.storage.write('isim', isim);

                      // Get.offAll(HomeView());
                    } else {
                      Get.snackbar(
                        "Warning",
                        "Please Enter Username & Password",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                  child: const Text("Send")),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

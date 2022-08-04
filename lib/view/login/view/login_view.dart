import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:fortune_telling/view/login/controller/fortune_find_controller.dart';
import 'package:get/get.dart';

import '../../../core/database/local/my_storage.dart';
import '../../../core/extension/context_extension.dart';
import '../../home/home_view.dart';
import '../controller/text_controller.dart';

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
                onChanged: (val) {
                  print(zodiacController.getZodicaSign(DateTime.parse(val)));
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    String isim = textController.usernameController.text;
                    String soyisim = textController.passwordController.text;

                    if (isim != '' && soyisim != '') {
                      _myStorage.getStrogare.write('isLogged', true);
                      _myStorage.getStrogare.write('isim', isim);
                      _myStorage.getStrogare.write('soyisim', soyisim);
                      Get.offAll(HomeView());
                    } else {
                      Get.snackbar("Error", "Please Enter Username & Password",
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                  child: const Text("send")),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

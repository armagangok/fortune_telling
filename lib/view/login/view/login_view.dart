import 'package:flutter/material.dart';
import 'package:fortune_telling/view/home/home_view.dart';
import 'package:fortune_telling/view/login/controller/text_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/extension/context_extension.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final userdata = GetStorage();

  final TextController textController = Get.find();

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
              ElevatedButton(
                  onPressed: () {
                    String isim = textController.usernameController.text;
                    String soyisim = textController.passwordController.text;

                    if (isim != '' && soyisim != '') {
                      userdata.write('isLogged', true);
                      userdata.write('isim', isim);
                      userdata.write('soyisim', soyisim);
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

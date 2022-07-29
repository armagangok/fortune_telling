import 'package:flutter/material.dart';
import 'package:fortune_telling/test_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import '../../../core/extension/context_extension.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final username_controller = TextEditingController();
  final password_controller = TextEditingController();
  final userdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.dismissKeyboard();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("isim"),
            TextField(
              controller: username_controller,
            ),
            SizedBox(height: 10),
            Text("soyisim"),
            TextField(
              controller: password_controller,
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  String isim = username_controller.text;
                  String soyisim = password_controller.text;

                  if (isim != '' && soyisim != '') {
                    print('Successfull');
                    userdata.write('isLogged', true);
                    userdata.write('isim', isim);
                    userdata.write('soyisim', soyisim);
                    Get.offAll(TestView());
                  } else {
                    Get.snackbar("Error", "Please Enter Username & Password",
                        snackPosition: SnackPosition.BOTTOM);
                  }
                },
                child: Text("send")),
            SizedBox(height: 10),
          ]),
        ),
      ),
    );
  }
}

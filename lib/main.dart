import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'view/personal/personal_view.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // initialRoute: AppPages.initial,
      // initialBinding: BindingsBuilder(() {
      //   Get.lazyPut(() => SplashController());
      // }),
      // getPages: AppPages.routes,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: PersonalView(),
    );
  }
}

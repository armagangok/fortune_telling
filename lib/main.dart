import 'package:flutter/material.dart';
import 'package:fortune_telling/view/personal/personal_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/navigation/app_pages.dart';
import 'core/theme/dark_theme.dart';

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
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: AppThemeDark.instance.darkTheme,
      home: PersonalView(),
    );
  }
}

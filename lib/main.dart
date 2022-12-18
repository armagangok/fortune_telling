import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortune_telling/root.dart';
import 'injection_container.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await GetStorage.init();
  initDependencies();

  runApp(const MyApp());
}

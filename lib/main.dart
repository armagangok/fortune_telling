import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortune_telling/core/navigation/constant/routes.dart';
import 'package:fortune_telling/injection_container.dart';
import 'package:get_storage/get_storage.dart';
import 'core/navigation/navigation_route.dart';
import 'core/navigation/navigation_service.dart';
import 'feature/splash/view/splash_view.dart';

import 'core/theme/dark_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await GetStorage.init();
  initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppThemeDark.instance.darkTheme,
      initialRoute: KRoute.SPLASH_PAGE,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      home: SplashView(),
    );
  }
}

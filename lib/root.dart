import 'package:flutter/material.dart';

import 'core/navigation/constant/routes.dart';
import 'core/navigation/navigation_route.dart';
import 'core/navigation/navigation_service.dart';
import 'core/theme/dark_theme.dart';
import 'feature/splash/view/splash_view.dart';

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

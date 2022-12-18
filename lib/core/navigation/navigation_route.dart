import 'package:flutter/material.dart';

import '../../feature/all_sign/view/all_signs_view.dart';
import '../../feature/find/view/find_zodiac_view.dart';
import '../../feature/home/view/home_view.dart';
import '../../feature/login/view/login_view.dart';
import '../../feature/personal/view/personal_view.dart';
import '../../feature/splash/view/splash_view.dart';

import 'constant/routes.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case KRoute.HOME:
        return _getRoute(const HomeView());

      case KRoute.SPLASH_PAGE:
        return _getRoute(SplashView());

      case KRoute.LOGIN_PAGE:
        return _getRoute(LoginView());

      case KRoute.PERSONAL_PAGE:
        return _getRoute(PersonalView());

      case KRoute.ZODIAC_DETAIL_PAGE:
        return _getRoute(AllSignsView());

      case KRoute.ZODIAC_SIGN_PAGE:
        return _getRoute(AllSignsView());

      case KRoute.FIND:
        return _getRoute(FindZodiacView());

      case KRoute.ZODIAC_DETAIL_PAGE:
        return _getRoute(FindZodiacView());

      // static const HOME = '/home';
      // static const SPLASH_PAGE = '/splash';
      // static const LOGIN_PAGE = '/login';
      // static const PERSONAL_PAGE = '/personal';
      // static const ZODIAC_DETAIL_PAGE = '/zodiacdetail';
      // static const FIND = '/find';
      // static const ZODIAC_SIGN_PAGE = '/zodiacsign';

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Text("Not Found."),
          ),
        );
    }
  }

  PageRoute _getRoute(Widget page) =>
      MaterialPageRoute(builder: (context) => page);
}

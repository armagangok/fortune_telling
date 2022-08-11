// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
  static const PERSONAL = _Paths.PERSONAL;
  static const ZODIAC_DETAIL = _Paths.ZODIAC_DETAIL;
  static const ZODIAC_SIGN = _Paths.ZODIAC_SIGN;
  static const HOME = _Paths.HOME;

}

abstract class _Paths {
  
  _Paths._();
  static const HOME= '/home';
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const PERSONAL = '/personal';
  static const ZODIAC_DETAIL = '/zodiacdetail';
  static const ZODIAC_SIGN = '/zodiacsign';
}

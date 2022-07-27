import 'package:flutter/material.dart';

extension EasyContext on BuildContext {
  double height(double ratio) => MediaQuery.of(this).size.height * ratio;
  double width(double ratio) => MediaQuery.of(this).size.width * ratio;

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Color get primaryColor => theme.primaryColor;
  Size get size => MediaQuery.of(this).size;
  EdgeInsets get padding => MediaQuery.of(this).padding;

  EdgeInsets symmetric({double horizontal = 0.0, double vertical = 0.0}) {
    return EdgeInsets.symmetric(
      horizontal: width(1.0) * horizontal,
      vertical: height(1.0) * vertical,
    );
  }

  EdgeInsets vertical({
    double left = 0.0,
    double top = 0.0,
    double rigth = 0.0,
    double bottom = 0.0,
  }) {
    return EdgeInsets.only(
      left: left * width(1.0),
      top: top * height(1.0),
      right: rigth * width(1.0),
      bottom: bottom * height(1.0),
    );
  }

  void dismissKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}

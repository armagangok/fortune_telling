import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  void dismissKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}

extension EasySize on BuildContext {
  double get dynamicHeight => mediaQuery.size.height;
  double get dynamicWidth => mediaQuery.size.width;

  double height(double value) => dynamicHeight * value;
  double width(double value) => dynamicWidth * value;

  double get lowWidth => dynamicWidth * 0.015;
  double get normalWidth => dynamicWidth * 0.025;
  double get mediumWidth => dynamicWidth * 0.035;
  double get bigWidth => dynamicWidth * 0.05;

  double get lowHeight => dynamicWidth * 0.015;
  double get normalHeight => dynamicHeight * 0.025;
  double get mediumHeight => dynamicHeight * 0.035;
  double get bigHeight => dynamicWidth * 0.05;
}

extension EasyTheme on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  Color get primaryColor => theme.primaryColor;
  ColorScheme get colors => theme.colorScheme;
}

extension EasyPadding on BuildContext {
  EdgeInsets get lowPadding => EdgeInsets.all(lowWidth);
  EdgeInsets get normalPadding => EdgeInsets.all(normalWidth);
  EdgeInsets get mediumPadding => EdgeInsets.all(mediumWidth);
  EdgeInsets get bigPadding => EdgeInsets.all(bigWidth);

  EdgeInsets symmetricPadding({
    double horizontal = 0.0,
    double vertical = 0.0,
  }) {
    return EdgeInsets.symmetric(
      horizontal: width(1.0) * horizontal,
      vertical: height(1.0) * vertical,
    );
  }
}

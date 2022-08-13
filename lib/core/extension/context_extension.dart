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

  double get lowValue => dynamicWidth * 0.015;
  double get normalValue => dynamicWidth * 0.025;
  double get mediumValue => dynamicWidth * 0.035;
  double get highValue => dynamicWidth * 0.05;
}

extension EasyTheme on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  Color get primaryColor => theme.primaryColor;
  ColorScheme get colors => theme.colorScheme;
}

extension EasyPadding on BuildContext {
  EdgeInsets get lowPadding => EdgeInsets.all(lowValue);
  EdgeInsets get normalPadding => EdgeInsets.all(normalValue);
  EdgeInsets get mediumPadding => EdgeInsets.all(mediumValue);
  EdgeInsets get highPadding => EdgeInsets.all(highValue);

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

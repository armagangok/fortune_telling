import 'package:flutter/material.dart';
import 'package:fortune_telling/core/constants/app_color.dart';

import 'base_theme.dart';

class AppThemeDark extends AppTheme {
  AppThemeDark._();
  static final instance = AppThemeDark._();

  ThemeData get darkTheme => ThemeData.dark().copyWith(
        primaryColor: AppColor.purple,
      );
}

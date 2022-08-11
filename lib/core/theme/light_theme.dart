import 'package:flutter/material.dart';
import 'package:fortune_telling/core/constants/app_color.dart';

import 'base_theme.dart';

class AppThemeLigth extends AppTheme {
  AppThemeLigth._();
  static final instance = AppThemeLigth._();

  ThemeData get ligthTheme => ThemeData.light().copyWith(
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                color: AppColor.purple,
              ),
            ),
          ),
        ),
      );
}

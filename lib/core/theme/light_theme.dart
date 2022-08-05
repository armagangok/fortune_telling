import 'package:flutter/material.dart';

import 'base_theme.dart';

class AppThemeLigth extends AppTheme {
  AppThemeLigth._();
  static final instance = AppThemeLigth._();

  ThemeData get ligthTheme => ThemeData.light().copyWith();
}

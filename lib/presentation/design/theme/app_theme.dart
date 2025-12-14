import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../token/app_colors.dart';
import '../token/app_typography.dart';

abstract class AppTheme {
  static ThemeMode themeMode = ThemeMode.system;

  static final ThemeData materialLightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    ),
    textTheme: AppTypography.textTheme,
  );

  static final ThemeData materialDarkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),
    textTheme: AppTypography.textTheme,
  );

  static const CupertinoThemeData cupertinoLightTheme = CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
  );

  static const CupertinoThemeData cupertinoDarkTheme = CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
  );
}

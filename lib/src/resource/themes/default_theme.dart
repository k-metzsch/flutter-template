import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Themes {
  static ThemeMode themeMode = ThemeMode.system;

  static final ThemeData materialLightTheme = ThemeData.light(useMaterial3: true);
  static final ThemeData materialDarkTheme = ThemeData.dark(useMaterial3: true);

  static const CupertinoThemeData cupertinoLightTheme = CupertinoThemeData(brightness: Brightness.light);
  static const CupertinoThemeData cupertinoDarkTheme = CupertinoThemeData(brightness: Brightness.dark);
}

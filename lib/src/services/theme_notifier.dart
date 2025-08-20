import 'package:flutter/material.dart';

import 'shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeNotifier();

  static const String _themeModeKey = 'theme_mode';
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();

    SharedP.setInt(_themeModeKey, mode.index);
  }

  Future<void> loadThemeMode() async {
    final int? index = SharedP.getInt(_themeModeKey);

    if (index != null && index >= 0 && index < ThemeMode.values.length) {
      _themeMode = ThemeMode.values[index];
    } else {
      _themeMode = ThemeMode.system;
    }

    notifyListeners();
  }
}

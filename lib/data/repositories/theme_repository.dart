// lib/data/repositories/theme_repository.dart
import 'package:flutter/material.dart';

import '../../services/preferences_service.dart';

class ThemeRepository {
  ThemeRepository();

  static const String _themeModeKey = 'theme_mode';

  Future<ThemeMode> loadThemeMode() async {
    final int? index = PreferencesService.getInt(_themeModeKey);
    if (index != null && index >= 0 && index < ThemeMode.values.length) {
      return ThemeMode.values[index];
    }
    return ThemeMode.system;
  }

  Future<void> saveThemeMode(ThemeMode mode) async {
    await PreferencesService.setInt(_themeModeKey, mode.index);
  }
}

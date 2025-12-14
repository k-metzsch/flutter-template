import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/theme_repository.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final ThemeRepository _repository;

  ThemeCubit({required ThemeRepository repository})
    : _repository = repository,
      super(ThemeMode.system);

  /// Load persisted theme (call before runApp if you want app to start with correct theme)
  Future<void> load() async {
    final ThemeMode mode = await _repository.loadThemeMode();
    emit(mode);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    emit(mode);
    await _repository.saveThemeMode(mode);
  }
}

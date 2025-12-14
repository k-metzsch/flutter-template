import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/theme_repository.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit({required ThemeRepository repository})
    : _repository = repository,
      super(ThemeMode.system);
  final ThemeRepository _repository;

  Future<void> load() async {
    final ThemeMode mode = await _repository.loadThemeMode();
    emit(mode);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    emit(mode);
    await _repository.saveThemeMode(mode);
  }
}

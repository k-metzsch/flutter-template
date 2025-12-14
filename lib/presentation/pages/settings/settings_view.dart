import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../l10n/app_localizations.dart';
import '../../cubit/theme/theme_cubit.dart';
import '../../design/token/app_spacing.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: const PlatformAppBar(title: Text(AppLocalizations.settings)),
      body: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (BuildContext context, ThemeMode themeMode) {
          final bool isDarkMode = themeMode == ThemeMode.dark;

          return ListView(
            children: <Widget>[
              const SizedBox(height: AppSpacing.lg),
              _buildDarkModeToggle(context, isDarkMode),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDarkModeToggle(BuildContext context, bool isDarkMode) {
    return PlatformListTile(
      title: const Text(AppLocalizations.darkMode),
      leading: Icon(context.platformIcons.brightness),
      trailing: PlatformSwitch(
        value: isDarkMode,
        onChanged: (bool value) => _onThemeChanged(context, value),
      ),
    );
  }

  void _onThemeChanged(BuildContext context, bool value) {
    HapticFeedback.lightImpact();
    final ThemeMode newMode = value ? ThemeMode.dark : ThemeMode.system;
    context.read<ThemeCubit>().setThemeMode(newMode);
  }
}

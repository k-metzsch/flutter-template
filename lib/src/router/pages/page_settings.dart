import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

import '../../services/theme_notifier.dart';

class AppSettingsPage extends StatefulWidget {
  const AppSettingsPage({super.key});

  @override
  State<AppSettingsPage> createState() => _AppSettingsPage();
}

class _AppSettingsPage extends State<AppSettingsPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);

    final bool themeMode = themeNotifier.themeMode == ThemeMode.dark;
    
    return PlatformScaffold(
      appBar: const PlatformAppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 20),
          PlatformListTile(
            title: const Text('Dark mode'),
            leading: const Icon(Icons.dark_mode_rounded),
            trailing: PlatformSwitch(value: themeMode, onChanged: (bool value) {
              themeNotifier.setThemeMode(value ? ThemeMode.dark : ThemeMode.system);
              HapticFeedback.lightImpact();
            }),
          ),
        ],
      ),
    );
  }
}

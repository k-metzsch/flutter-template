// lib/app.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'presentation/cubit/theme/theme_cubit.dart';
import 'presentation/design/theme/app_theme.dart';
import 'resources/app_config.dart';
import 'router/app_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final RouterConfig<Object> _routerConfig;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _routerConfig = AppRouter.router();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (BuildContext context, ThemeMode themeMode) {
        return PlatformProvider(
          builder: (BuildContext context) => PlatformTheme(
            themeMode: themeMode,
            materialLightTheme: AppTheme.materialLightTheme,
            materialDarkTheme: AppTheme.materialDarkTheme,
            cupertinoLightTheme: AppTheme.cupertinoLightTheme,
            cupertinoDarkTheme: AppTheme.cupertinoDarkTheme,
            builder: (BuildContext context) => PlatformApp.router(
              debugShowCheckedModeBanner: AppConfig.debug,
              localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                DefaultMaterialLocalizations.delegate,
                DefaultWidgetsLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
              ],
              routerConfig: _routerConfig,
              title: AppConfig.appName,
            ),
          ),
        );
      },
    );
  }
}

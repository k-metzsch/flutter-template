import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

import 'src/config/firebase_options.dart';
import 'src/mock/device_preview.dart';
import 'src/resource/resources.dart';
import 'src/router/router.dart';
import 'src/services/shared_preferences.dart';
import 'src/services/theme_notifier.dart';

Future<void> setup() async {
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  await FirebasePerformance.instance.setPerformanceCollectionEnabled(true);
  await SharedP.init();
}

Future<void> main() async {
  await setup();

  final ThemeNotifier themeNotifier = ThemeNotifier();
  await themeNotifier.loadThemeMode();

  final Widget app = ChangeNotifierProvider<ThemeNotifier>.value(
    value: themeNotifier,
    child: const AppMainProcess(),
  );

  PreviewApp(app);
}

class AppMainProcess extends StatelessWidget {
  const AppMainProcess({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return PlatformProvider(
      builder: (BuildContext context) => PlatformTheme(
        themeMode: themeNotifier.themeMode ,
        materialLightTheme: Themes.materialLightTheme,
        materialDarkTheme: Themes.materialDarkTheme,
        cupertinoLightTheme: Themes.cupertinoLightTheme,
        cupertinoDarkTheme: Themes.cupertinoDarkTheme,
        builder: (BuildContext context) => PlatformApp(
          debugShowCheckedModeBanner: AppData.debug,
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          onGenerateRoute: (RouteSettings settings) => AppRouter.shouldAuth(context),
          routes: AppRouter.generatedRoutes,
          title: AppData.appName,
        ),
      ),
    );
  }
}

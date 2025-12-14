import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app.dart';
import 'data/repositories/theme_repository.dart';
import 'presentation/cubit/theme/theme_cubit.dart';
import 'services/preferences_service.dart';

Future<void> bootstrap({
  FutureOr<void> Function(Object error, StackTrace stack)? onError,
}) async {
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: binding);

  await PreferencesService.init();

  final ThemeRepository themeRepository = ThemeRepository();

  final ThemeCubit themeCubit = ThemeCubit(repository: themeRepository);
  await themeCubit.load();

  await runZonedGuarded(
    () async {
      runApp(
        MultiRepositoryProvider(
          providers: <RepositoryProvider<dynamic>>[
            RepositoryProvider<ThemeRepository>.value(value: themeRepository),
          ],
          child: MultiBlocProvider(
            providers: <BlocProvider<dynamic>>[
              BlocProvider<ThemeCubit>.value(value: themeCubit),
            ],
            child: const App(),
          ),
        ),
      );
    },
    (Object error, StackTrace stack) {
      print('Uncaught error in bootstrap: $error\n$stack');
      if (onError != null) {
        onError(error, stack);
      }
    },
  );
}

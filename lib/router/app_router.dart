import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../presentation/pages/home/home_page.dart';
import '../presentation/pages/settings/settings_page.dart';
import 'app_transitions.dart';

abstract class AppRouter {
  static const String home = '/';
  static const String settings = '/settings';

  static GoRouter router() {
    return GoRouter(
      initialLocation: home,
      routes: <RouteBase>[
        GoRoute(
          path: home,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return AppTransitions.buildTransition<void>(
              child: const HomePage(),
              state: state,
              type: TransitionType.fade,
            );
          },
        ),
        GoRoute(
          path: settings,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return AppTransitions.buildTransition<void>(
              child: const SettingsPage(),
              state: state,
            );
          },
        ),
      ],
    );
  }
}

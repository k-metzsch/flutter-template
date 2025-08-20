import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../resource/data/transitions.dart';
import 'pages/page_main.dart';
import 'pages/page_settings.dart';

class AppRouter {
  AppRouter._();

  static const List<Widget> _routes = <Widget>[
    AppMainPage(),
    AppSettingsPage(),
  ];

  static String _getPageName(String input) => input.replaceAll(RegExp(r'^(App)|Page$'), '');

  static Map<String, WidgetBuilder>? generatedRoutes = <String, WidgetBuilder>{
    for (Widget e in _routes) _getPageName('$e'): (_) => e
  };

  static Map<String, Widget> routes = <String, Widget>{
    for (Widget e in _routes) _getPageName('$e'): e
  };

  static PageRoute<dynamic> shouldAuth(BuildContext context) {
    return platformPageRoute(
      context: context,
      builder: (BuildContext context) {
        // Can check if the user is authenticated
        return const AppMainPage();
      },
    );
  }

  static Route<Object?> _createRoute(String route, Option? transition) {
    return PageRouteBuilder<dynamic>(
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) => routes[route]!,
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) => TransitionsData(
        context,
        animation,
        secondaryAnimation,
        child,
      ).slideTransition(transition),
    );
  }

  static void push(BuildContext context, String route, {Option? transition}) {
    Navigator.of(context).push(_createRoute(route, transition));
  }

  static void replace(BuildContext context, String route, {Option? transition}) {
    Navigator.of(context).pushReplacement(_createRoute(route, transition));
  }

  static void pop(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      throw Exception('No return route, instead use pushRoute');
    }
  }
}

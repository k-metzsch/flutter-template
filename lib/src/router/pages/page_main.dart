import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../resource/resources.dart';
import '../../services/rating.dart';
import '../router.dart';

class AppMainPage extends StatefulWidget {
  const AppMainPage({super.key});

  @override
  State<AppMainPage> createState() => _AppMainPage();
}

class _AppMainPage extends State<AppMainPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  Future<void> initialization() async {
    FlutterNativeSplash.remove();
    Rating.ratePrompt(context);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(AppData.appName),
        trailingActions: <Widget>[
          IconButton(
            onPressed: () => AppRouter.push(context, 'Settings'),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Counter: $_counter'),
            const SizedBox(height: 20),
            PlatformElevatedButton(
              onPressed: () {
                setState(() => _counter++);
                HapticFeedback.lightImpact();
              },
              child: const Text('Click'),
            ),
          ],
        ),
      ),
    );
  }
}

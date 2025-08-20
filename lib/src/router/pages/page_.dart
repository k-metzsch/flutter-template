import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class App_RouteName_Page extends StatefulWidget {
  const App_RouteName_Page({super.key});

  @override
  State<App_RouteName_Page> createState() => _App_RouteName_Page();
}

class _App_RouteName_Page extends State<App_RouteName_Page> {
  // @override
  // void initState() {
  //   super.initState();
  //   initialization();
  // }
  //
  // void initialization() async {
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text('Page Title'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('New Page!'),
          ],
        ),
      ),
    );
  }
}

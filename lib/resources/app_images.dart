import 'package:flutter/material.dart';

import 'app_assets.dart';

abstract class AppImages {
  static Image logo({double? height}) {
    return Image.asset(
      '${AppAssets.imagesPath}inapp_assets/logo_1024x1024.png',
      height: height ?? 250,
    );
  }
}

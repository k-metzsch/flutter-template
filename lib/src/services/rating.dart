import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

import '../resource/resources.dart';

abstract class Rating {
  static void ratePrompt(BuildContext context) {
    final RateMyApp rateMyApp_ = RateMyApp(
      minDays: AppData.rateMyAppTest ? 0 : 7,
      remindDays: AppData.rateMyAppTest ? 0 : 7,
      minLaunches: AppData.rateMyAppTest ? 0 : 10,
      remindLaunches: AppData.rateMyAppTest ? 0 : 10,
      googlePlayIdentifier: AppData.googlePlayIdentifier,
      appStoreIdentifier: AppData.appStoreIdentifier,
    );

    rateMyApp_.init().then((_) {
      if (context.mounted && rateMyApp_.shouldOpenDialog) {
        rateMyApp_.showStarRateDialog(context);
      }
    });
  }
}

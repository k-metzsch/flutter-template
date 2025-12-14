import 'package:in_app_review/in_app_review.dart';

import '../resources/app_config.dart';
import 'preferences_service.dart';

abstract class RatingService {
  static const String _launchCountKey = 'launch_count';
  static const String _lastPromptKey = 'last_rating_prompt';
  static const int _minLaunches = 10;
  static const int _minDaysBetweenPrompts = 7;

  static Future<void> requestReview() async {
    if (AppConfig.ratingTestMode) {
      await _showReview();
      return;
    }

    final int launchCount = PreferencesService.getInt(_launchCountKey) ?? 0;
    await PreferencesService.setInt(_launchCountKey, launchCount + 1);

    if (launchCount < _minLaunches) {
      return;
    }

    final int? lastPromptTimestamp = PreferencesService.getInt(_lastPromptKey);
    final DateTime now = DateTime.now();

    if (lastPromptTimestamp != null) {
      final DateTime lastPrompt = DateTime.fromMillisecondsSinceEpoch(
        lastPromptTimestamp,
      );
      final int daysSinceLastPrompt = now.difference(lastPrompt).inDays;

      if (daysSinceLastPrompt < _minDaysBetweenPrompts) {
        return;
      }
    }

    await _showReview();
    await PreferencesService.setInt(_lastPromptKey, now.millisecondsSinceEpoch);
  }

  static Future<void> _showReview() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      await inAppReview.requestReview();
    }
  }

  static Future<void> openStoreListing() async {
    final InAppReview inAppReview = InAppReview.instance;
    await inAppReview.openStoreListing(
      appStoreId: AppConfig.appStoreIdentifier,
    );
  }
}

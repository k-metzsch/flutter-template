# Flutter Platform Template

This template is a cross-platform Flutter starter project designed for rapid development of apps with both Material and Cupertino (iOS) design, localization, theming, and a modern splash screen. It demonstrates best practices for state management, theme persistence, and platform-aware UI.

---

## Features

- **Platform-aware UI:** Uses [`flutter_platform_widgets`](https://pub.dev/packages/flutter_platform_widgets) for native look and feel on both Android and iOS.
- **Persistent User Preferences:** Remembers the user’s theme selection and other settings across app launches using [`shared_preferences`](https://pub.dev/packages/shared_preferences).
- **Theming:** Supports light, dark, and system theme modes, with user preference saved using `shared_preferences`.
- **Localization:** Ready for internationalization with ARB files and Flutter’s localization system.
- **Splash Screen:** Customizable splash screen using [`flutter_native_splash`](https://pub.dev/packages/flutter_native_splash).
- **State Management:** Uses [`provider`](https://pub.dev/packages/provider) for simple and scalable state management.
- **Navigation:** Centralized routing for easy navigation.
- **Testing:** Includes example widget tests.
- **App Rating:** Prompt users to rate your app using [`rate_my_app`](https://pub.dev/packages/rate_my_app).

---

## Dependencies

This template uses a carefully selected set of dependencies to provide a robust, scalable, and modern Flutter development experience:

### Main Dependencies

| Package                   | Purpose                                                                 |
|---------------------------|-------------------------------------------------------------------------|
| flutter_platform_widgets  | Platform-aware widgets (Material/Cupertino)                             |
| flutter_native_splash     | Custom native splash screens                                            |
| firebase_core             | Core Firebase integration                                               |
| firebase_analytics        | Analytics for tracking user behavior                                    |
| firebase_performance      | Performance monitoring for your app                                     |
| firebase_storage          | Cloud storage for files and media                                       |
| intl                      | Internationalization and localization (used with `flutter gen-l10n`)    |
| shared_preferences        | Persistent storage for user preferences (e.g., theme, settings)         |
| rate_my_app               | Prompt users to rate your app                                           |
| provider                  | Simple and scalable state management                                    |

### Dev Dependencies

| Package                | Purpose                                                                                  |
|------------------------|------------------------------------------------------------------------------------------|
| device_preview         | Emulate different devices and platforms, and generate screenshots during development     |
| flutter_lints          | Provides recommended lint rules for Dart and Flutter, helping you write clean, safe code |

---

## App Icons

This template uses [icon.kitchen](https://icon.kitchen) to generate custom app launcher icons for Android and iOS.

**How to customize and apply:**
1. Visit [icon.kitchen](https://icon.kitchen) and upload your icon image.
2. Select the platforms and options you need.
3. Download the generated icon assets.
4. Replace the appropriate icon files in your Flutter project (typically in the `android/app/src/main/res/` and `ios/Runner/Assets.xcassets/AppIcon.appiconset/` directories).
5. Rebuild your app to see the new app icon.

---

## About the Linter

- **`flutter_lints`**:  
  This package provides a set of recommended lint rules for Dart and Flutter projects.  
  It helps you maintain code quality, consistency, and best practices by warning about potential errors, style issues, and anti-patterns.  
  Using a linter is highly recommended for all production Flutter projects.

---

## Splash Screen

This template uses [`flutter_native_splash`](https://pub.dev/packages/flutter_native_splash) to generate a native splash screen for both Android and iOS.

**How to customize and apply:**
1. Edit the `flutter_native_splash.yaml` file to set your splash image, background color, and foreground color.
2. Run the following command to generate the splash screens:
   ```sh
   dart run flutter_native_splash:create
   ```
3. Rebuild your app to see the updated splash screen.

---

## Localization (l10n)

- To add or change localizations, edit the `.arb` files in `lib/l10n/`.
- After editing, run the following command to generate localization code:
  ```sh
  flutter gen-l10n
  ```
- This will update the generated localization files
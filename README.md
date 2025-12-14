# Flutter Platform Template

This template is a cross-platform Flutter starter project updated to use the BLoC family (Cubit) architecture. It’s designed for rapid development of apps with both Material and Cupertino (iOS) design, localization readiness, theming, and a modern native splash screen. It demonstrates best practices for BLoC-style state management, theme persistence, and platform-aware UI.

---

## Features

- **Platform-aware UI:** Uses `flutter_platform_widgets` for native look and feel on both Android and iOS.  
- **Persistent User Preferences:** Remembers the user’s theme selection and other settings across app launches using `shared_preferences`.  
- **Theming:** Supports light, dark, and system theme modes, with user preference saved using `shared_preferences`.  
- **Localization:** Ready for internationalization with ARB files and Flutter’s localization system (l10n directory present; wiring planned/ongoing).  
- **Splash Screen:** Customizable native splash screen using `flutter_native_splash`.  
- **State Management:** Uses BLoC/Cubit (`flutter_bloc` + `equatable`) for predictable and testable app state.  
- **Navigation:** Centralized routing using `go_router`.  
- **Testing:** Includes example widget tests and supports standard Flutter testing.  
- **In-app Review:** Prompt users to rate your app using `in_app_review`.  
- **App Icons:** App icons via icon.kitchen (you provide the artwork; replace generated assets).  

---

## Dependencies

This template uses the packages listed in `pubspec.yaml`.

### Main Dependencies

| Package                   | Purpose                                                                 |
|---------------------------|-------------------------------------------------------------------------|
| flutter_bloc              | BLoC / Cubit state management                                           |
| equatable                 | Value equality for BLoC states/events                                   |
| go_router                 | Declarative routing                                                     |
| shared_preferences        | Persistent storage for user preferences (theme, settings)               |
| flutter_platform_widgets  | Platform-adaptive widgets (Material & Cupertino)                        |
| flutter_native_splash     | Native splash screen generator                                          |
| in_app_review             | In-app review / rating prompt                                           |
| path_provider             | Access device file system paths                                         |
| cupertino_icons           | iOS-style icons                                                         |

### Dev Dependencies

| Package                | Purpose                                                                 |
|------------------------|-------------------------------------------------------------------------|
| flutter_test           | Flutter testing framework                                               |
| flutter_lints          | Recommended lint rules for Dart & Flutter                               |
| bloc_lint              | Additional lint rules for BLoC usage                                    |

---

## Project structure (lib/ root)

The repository organizes code to separate concerns and make the project scalable and maintainable. The layout below shows the current `lib/` structure:

lib/
├── data/
│   ├── models/
│   └── repositories/
├── l10n/
├── presentation/
│   ├── cubit/
│   ├── design/
│   ├── pages/
│   └── widgets/
├── resources/
├── router/
├── services/
├── app.dart
├── bootstrap.dart
└── main.dart

Notes:
- `presentation/cubit/` contains Cubits (and BLoC-like state classes) that expose UI-facing state and handle side effects.
- `data/repositories/` encapsulate data sources (local or remote).
- `presentation/pages/` and `presentation/widgets/` contain screens and reusable widgets respectively.
- `router/` contains the `go_router` configuration and route definitions.
- `l10n/` is prepared for ARB localization files and generated localization artifacts.
- `bootstrap.dart` is used for early initialization (dependency injection, service setup, preferences).
- `app.dart` wires theme, localization delegates (when implemented), and top-level providers.

---

## App Icons

This template uses icon.kitchen to generate custom app launcher icons for Android and iOS.

How to customize and apply:
1. Visit https://icon.kitchen and upload your icon artwork.
2. Select the platforms and options you need.
3. Download the generated icon assets.
4. Replace the appropriate icon files in your Flutter project:
   - Android: `android/app/src/main/res/`
   - iOS: `ios/Runner/Assets.xcassets/AppIcon.appiconset/`
5. Rebuild your app to see the new app icon.

---

## About the Linter

- `flutter_lints` provides recommended lint rules for Dart and Flutter projects and helps maintain code quality and consistency.  
- `bloc_lint` adds linting guidance tailored for BLoC/Cubit patterns.  
Keep analysis green — follow the project's `analysis_options.yaml` rules when contributing.

---

## Splash Screen

This template uses `flutter_native_splash` to generate a native splash screen for Android and iOS.

How to customize and apply:
1. Edit `flutter_native_splash.yaml` to set your splash image(s) and background color(s).
2. Generate the splash screen assets and native configuration:
   ```sh
   dart run flutter_native_splash:create
   ```
3. Rebuild your app.

---

## Localization (l10n)

- Add or update `.arb` files in `lib/l10n/`.  
- Generate localization classes after editing ARB files:
  ```sh
  flutter gen-l10n
  ```
- Wire the generated localization delegates into `app.dart` (the repo includes the `l10n/` directory and the localization step is planned).

---

## Contributing & Recommended Patterns

- Prefer Cubits for local/simple state and BLoC for more complex event/state flows. Keep business logic out of widgets.  
- Use repositories to isolate data sources and make Cubits testable.  
- Keep UI code in `presentation/pages/` and `presentation/widgets/`; Cubits live in `presentation/cubit/`.  
- Respect lint rules from `analysis_options.yaml` and keep the codebase clean and well-typed.


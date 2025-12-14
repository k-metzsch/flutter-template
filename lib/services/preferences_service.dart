import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesService {
  static SharedPreferences? _instance;

  static Future<void> init() async {
    _instance ??= await SharedPreferences.getInstance();
  }

  static SharedPreferences get _prefs {
    if (_instance == null) {
      throw StateError(
        'SharedPreferencesService not initialized. Call init() first.',
      );
    }
    return _instance!;
  }

  static Future<bool> setString(String key, String value) async {
    return _prefs.setString(key, value);
  }

  static String? getString(String key) {
    return _prefs.getString(key);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    return _prefs.setStringList(key, value);
  }

  static List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  static Future<bool> setInt(String key, int value) async {
    return _prefs.setInt(key, value);
  }

  static int? getInt(String key) {
    return _prefs.getInt(key);
  }

  static Future<bool> setDouble(String key, double value) async {
    return _prefs.setDouble(key, value);
  }

  static double? getDouble(String key) {
    return _prefs.getDouble(key);
  }

  static Future<bool> setBool(String key, bool value) async {
    return _prefs.setBool(key, value);
  }

  static bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  static Future<bool> remove(String key) async {
    return _prefs.remove(key);
  }

  static bool containsKey(String key) {
    return _prefs.containsKey(key);
  }

  static Future<bool> clear() async {
    return _prefs.clear();
  }

  static Set<String> getKeys() {
    return _prefs.getKeys();
  }
}

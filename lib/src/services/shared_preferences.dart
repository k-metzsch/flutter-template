import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedP {
  static late SharedPreferences _sharedPrefs;

  static Future<SharedPreferences> init() async => _sharedPrefs = await SharedPreferences.getInstance();

  static void setString(String key, String string) => _sharedPrefs.setString(key, string);

  static void setStringList(String key, List<String> string) => _sharedPrefs.setStringList(key, string);

  static void setInt(String key, int int) => _sharedPrefs.setInt(key, int);
  
  static void setDouble(String key, double double) => _sharedPrefs.setDouble(key, double);

  static void setBool(String key, bool bool) => _sharedPrefs.setBool(key, bool);

  static void remove(String key) => _sharedPrefs.remove(key);

  static bool checkKeyExists(String key) => _sharedPrefs.containsKey(key);

  static String? getString(String key) => _sharedPrefs.getString(key);

  static List<String>? getStringList(String key) => _sharedPrefs.getStringList(key);

  static bool? getBool(String key) => _sharedPrefs.getBool(key);

  static int? getInt(String key) => _sharedPrefs.getInt(key);

  static double? getDouble(String key) => _sharedPrefs.getDouble(key);

  static void removeValues(String key) => _sharedPrefs.remove(key);
}

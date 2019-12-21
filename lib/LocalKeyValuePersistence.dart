import 'package:grade_plus_plus/bloc/theme/exports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalKeyValuePersistence {
  static final String _darkMode = "darkMode";

  static Future<bool> setTheme(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(_darkMode, value);
  }

  static Future<ThemeState> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_darkMode)) {
      if (prefs.get(_darkMode)) {
        return DarkTheme();
      }
    }
    return LightTheme();
  }
}

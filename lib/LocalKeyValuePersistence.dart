import 'dart:convert';

import 'package:grade_plus_plus/bloc/theme/exports.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/notifications/notif_state.dart';

class LocalKeyValuePersistence {
  static final String _darkMode = "darkMode";
  static final String _notifState = "notifState";

  static setTheme(bool value) async {
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

  static setNotifState(bool hasSemester, bool hasGrades) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    NotifState notifState =
        new NotifState(hasSemester: hasSemester, hasGrades: hasGrades);
    return prefs.setString(_notifState, json.encode(notifState));
  }

  static Future<NotifState> getNotifState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_notifState)) {
      return NotifState.fromJson(json.decode(prefs.getString(_notifState)));
    }
    return new NotifState(hasSemester: true, hasGrades: true);
  }
}

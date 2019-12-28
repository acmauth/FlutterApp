import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/notifications/notif_state.dart';
import 'bloc/theme/exports.dart';
import 'entities/course/SuggestedCourseData.dart';
import 'entities/user/UserData.dart';

class LocalKeyValuePersistence {
  static final String _darkMode = "darkMode";
  static final String _notifState = "notifState";
  static final String _userData = "userData";
  static final String _suggestedCourses = "suggestedCourses";

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
    return prefs.setString(_notifState, jsonEncode(notifState));
  }

  static Future<NotifState> getNotifState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_notifState)) {
      return NotifState.fromJson(jsonDecode(prefs.getString(_notifState)));
    }
    return new NotifState(hasSemester: true, hasGrades: true);
  }

  static setUserData(UserData userData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_userData, jsonEncode(userData));
  }

  static Future<UserData> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_userData)) {
      return UserData.fromJson(jsonDecode(prefs.getString(_userData)));
    }
    return new UserData(
        estYear: null,
        schoolData: null,
        favSubjects: null,
        favTeachers: null,
        semesterDataList: null);
  }

  static setListSuggestedCourses(
      List<SuggestedCourseData> suggestedCourses) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_suggestedCourses, jsonEncode(suggestedCourses));
  }

  static Future<List<SuggestedCourseData>> getListSuggestedCourses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_suggestedCourses)) {
      List<SuggestedCourseData> suggestedCourses =
          json.decode(prefs.getString(_suggestedCourses));
      return suggestedCourses;
    }
    return null;
  }
}

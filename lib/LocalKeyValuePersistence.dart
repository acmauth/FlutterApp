import 'dart:convert';

import 'package:grade_plus_plus/DataFetcher.dart';
import 'package:grade_plus_plus/entities/course/PredictedCourse.dart';
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
  static final String _predictedCourses = "predictedCourses";
  static final String _token = "token";
  static final String _refreshToken = "refreshToken";
  static final String _searchHistory = "searchHistory";

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

  static setUserToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_token, token);
  }

  static setRefreshToken(String refreshToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_refreshToken, refreshToken);
  }

  static getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_token)) {
      return (prefs.getString(_token));
    }
    return null;
  }

  static getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_refreshToken)) {
      return (prefs.getString(_refreshToken));
    }
    return null;
  }

  static deleteTokens() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_token);
    prefs.remove(_refreshToken);
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
      return (UserData.fromJson(jsonDecode(prefs.getString(_userData))));
    }
    return DataFetcher.fetchDefaultUserData();
  }

  static setListSuggestedCourses(
      List<SuggestedCourseData> suggestedCourses) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stringList = new List();
    suggestedCourses.forEach((element) => stringList.add(jsonEncode(element)));
    prefs.setStringList(_suggestedCourses, stringList);
  }

  static Future<List<SuggestedCourseData>> getListSuggestedCourses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_suggestedCourses)) {
      List<String> stringList = prefs.getStringList(_suggestedCourses);
      List<SuggestedCourseData> courseData = new List();
      stringList.forEach((element) =>
          courseData.add(SuggestedCourseData.fromJson(jsonDecode(element))));
      return courseData;
    }
    return DataFetcher.fetchDefaultSuggestedCourses();
  }

  static setListPredictedCourses(List<PredictedCourse> predictedCourses) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stringList = new List();
    predictedCourses.forEach((element) => stringList.add(jsonEncode(element)));
    prefs.setStringList(_predictedCourses, stringList);
  }

  static Future<List<PredictedCourse>> getListPredictedCourses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_predictedCourses)) {
      List<String> stringList = prefs.getStringList(_predictedCourses);
      List<PredictedCourse> courseData = new List();
      stringList.forEach((element) =>
          courseData.add(PredictedCourse.fromJson(jsonDecode(element))));
      return courseData;
    }
    return DataFetcher.fetchDefaultPredictedCourses();
  }

  static updateSearchHistory(String element) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_searchHistory)) {
      List<String> history = prefs.getStringList(_searchHistory);
      if (!history.contains(element)) {
        if (history.length >= 10) {
          history.removeAt(0);
        }
        history.add(element);
        prefs.setStringList(_searchHistory, history);
      }
    } else {
      prefs.setStringList(_searchHistory, [element]);
    }
  }

  static Future<List<String>> getSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_searchHistory)) {
      List<String> history = prefs.getStringList(_searchHistory);
      return history;
    } else {
      return [];
    }
  }

  static removeFromSearchHistory(String element) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_searchHistory)) {
      List<String> history = prefs.getStringList(_searchHistory);
      history.remove(element);
      prefs.setStringList(_searchHistory, history);
    }
  }
}

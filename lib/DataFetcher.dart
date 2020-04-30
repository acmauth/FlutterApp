import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'LocalKeyValuePersistence.dart';
import 'entities/course/BaseCourseData.dart';
import 'entities/course/Course.dart';
import 'entities/course/CourseDifficulty.dart';
import 'entities/course/PassedCourseData.dart';
import 'entities/course/PredictedCourse.dart';
import 'entities/course/SuggestedCourseData.dart';
import 'entities/user/FormData.dart' as UserFD;
import 'entities/user/SchoolData.dart';
import 'entities/user/SemesterData.dart';
import 'entities/user/Teacher.dart';
import 'entities/user/UserData.dart';

class DataFetcher {
  static String token = '';
  static String refresh = '';

  static Dio dio = new Dio(new BaseOptions(
    baseUrl: "http://snf-872013.vm.okeanos.grnet.gr:3000/",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

  static void _setTokens(String tokenV, String refreshV) {
    token = tokenV;
    refresh = refreshV;
    dio.options.headers = {HttpHeaders.authorizationHeader: "Bearer $token"};
  }

  static Future<bool> doAuth(
    String email,
    String pwd,
    bool isLogin,
  ) async {
    try {
      var res = await dio.post(
        isLogin ? "auth/login/" : "auth/signup/",
        data: {'email': email, 'password': pwd},
      );
      if (res.statusCode != 200 && res.statusCode != 201) {
        return false;
      }
      var json = res.data;
      _setTokens(json["token"], json["refreshToken"]);
      LocalKeyValuePersistence.setUserToken(token);
      LocalKeyValuePersistence.setRefreshToken(refresh);
      return true;
    } on DioError catch (_) {
      return false;
    }
  }

  static Future<bool> localAuth(lToken, lRefresh) async {
    token = lToken;
    refresh = lRefresh;
    _setTokens(lToken, lRefresh);
    if (token != null && refresh != null) {
      try {
        var res = await dio.get("user/profile");
        if (res.statusCode != 200 && res.statusCode != 201) {
          return false;
        }
        return true;
      } on DioError catch (_) {
        return false;
      }
    }
    return false;
  }

  static Future<List<PredictedCourse>> fetchPredictedCourses() async {
    try {
      var res = await dio.get("course/predict/");
      return compute(_parsePredictedCourses, res.data);
    } on DioError catch (_) {
      return LocalKeyValuePersistence.getListPredictedCourses();
    }
  }

  static UserData fetchUserData() {
    // To be implemented for data fetching
    return new UserData(
        estYear: null,
        schoolData: null,
        favSubjects: null,
        favTeachers: null,
        semesterDataList: null);
  }

  static List<SuggestedCourseData> fetchSuggestedCourses() {
    // To be implemented for data fetching
    return new List();
  }

  static uploadFormData(UserFD.FormData data) async {
    try {
      await dio.patch(
        "user/profile",
        data: jsonEncode(data),
      );
      return true;
    } on DioError catch (_) {
      return false;
    }
  }

  static uploadGrades(String filePath) async {
    try {
      var fd = new FormData.fromMap(
        {"grades": await MultipartFile.fromFile(filePath)},
      );
      await dio.put("user/grades/pdf", data: fd);
      return true;
    } on DioError catch (_) {
      return false;
    }
  }

  static List<PredictedCourse> fetchDefaultPredictedCourses() {
    return <PredictedCourse>[
      PredictedCourse(
          courseID: '600000307', gradePrediction: 10, distribution: 20),
      PredictedCourse(
          courseID: '40002963', gradePrediction: 10, distribution: 20)
    ];
  }

  static UserData fetchDefaultUserData() {
    return UserData(
      name: 'Test Subject',
      schoolData: SchoolData(
        department: 'Computer Science',
        semester: 5,
      ),
      estYear: 2021,
      favSubjects: <String>[
        "astronomy",
        "object oriented programming",
        "linear algebra",
        "data structures",
      ],
      favTeachers: <String>[
        "mr bean",
        "the janitor",
      ],
      semesterDataList: <SemesterData>[
        SemesterData(
          id: 1,
          courseDataList: <PassedCourseData>[
            PassedCourseData(
              baseData: BaseCourseData(
                title: 'My course title',
                code: 'ABC-01-234',
                teacher: 'John Smith',
                averageGrade: 9.9,
                difficulty: CourseDifficulty.EASY,
              ),
              grade: 9,
              year: '2013-2014',
            ),
            PassedCourseData(
              baseData: BaseCourseData(
                title: 'Some subject',
                code: 'ABC-91-114',
                teacher: 'Dr Jeff',
                averageGrade: 7.5,
                difficulty: CourseDifficulty.MEDIUM,
              ),
              grade: 10,
              year: '2013-2014',
            ),
          ],
        ),
        SemesterData(
          id: 2,
          courseDataList: <PassedCourseData>[
            PassedCourseData(
              baseData: BaseCourseData(
                title: 'My new course title',
                code: 'XYZ-01-234',
                teacher: 'Hello World',
                averageGrade: 4.5,
                difficulty: CourseDifficulty.HARD,
              ),
              grade: 2,
              year: '2013-2014',
            ),
          ],
        ),
      ],
    );
  }

  static List<SuggestedCourseData> fetchDefaultSuggestedCourses() {
    return <SuggestedCourseData>[
      SuggestedCourseData(
        baseData: BaseCourseData(
          title: 'Foundations of Cryptography',
          code: 'NGE-06-03',
          teacher: 'Konstantinos Draziotis',
          averageGrade: 8,
          difficulty: CourseDifficulty.MEDIUM,
        ),
        match: 85,
        favTeacher: true,
      ),
      SuggestedCourseData(
        baseData: BaseCourseData(
          title: 'Mobile Device Interfaces',
          code: 'NET-06-01',
          teacher: 'Thrasyvoulos Tsiatsos',
          averageGrade: 9.5,
          difficulty: CourseDifficulty.EASY,
        ),
        match: 65,
      ),
      SuggestedCourseData(
        baseData: BaseCourseData(
          title: 'Computer Graphics',
          code: 'NDM-07-04',
          teacher: 'Nikos Nikolaidis',
          averageGrade: 7,
          difficulty: CourseDifficulty.HARD,
        ),
        match: 55,
      ),
    ];
  }

  static Future<HashMap<String, Course>> fetchCourses() async {
    try {
      var res = await dio.get("list/courses/");
      return compute(_parseCourses, res.data);
    } on DioError catch (_) {
      return LocalKeyValuePersistence.getMapCourses();
    }
  }

  static HashMap<String, Course> _parseCourses(dynamic data) {
    HashMap<String, Course> instanceCourses = new HashMap();
    data.forEach((json) =>
        instanceCourses.putIfAbsent(json['_id'], () => Course.fromJson(json)));
    return instanceCourses;
  }

  static Future<HashMap<String, Teacher>> fetchTeachers() async {
    try {
      var res = await dio.get("list/teachers/");
      return compute(_parseTeachers, res.data);
    } on DioError catch (_) {
      return LocalKeyValuePersistence.getMapTeachers();
    }
  }

  static HashMap<String, Teacher> _parseTeachers(dynamic data) {
    HashMap<String, Teacher> instanceCourses = new HashMap();
    data.forEach((json) =>
        instanceCourses.putIfAbsent(json['_id'], () => Teacher.fromJson(json)));
    return instanceCourses;
  }

  static List<PredictedCourse> _parsePredictedCourses(dynamic data) {
    List<PredictedCourse> instancePredictedCourses = new List();
    for (MapEntry entry in data.entries) {
      if (entry.key != 'version') {
        Map<String, dynamic> value = entry.value;
        value.putIfAbsent('id', () => entry.key);
        instancePredictedCourses.add(PredictedCourse.fromJson(value));
      }
    }
    return instancePredictedCourses;
  }

  static Future<bool> changePassword(
    String prevPassword,
    String newPassword,
  ) async {
    try {
      await dio.patch(
        "user/change_password/",
        data: {'previousPassword': prevPassword, 'newPassword': newPassword},
      );
      return true;
    } on DioError catch (_) {
      return false;
    }
  }
}

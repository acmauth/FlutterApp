import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'LocalKeyValuePersistence.dart';
import 'entities/course/BaseCourseData.dart';
import 'entities/course/Course.dart';
import 'entities/course/CourseDifficulty.dart';
import 'entities/course/PassedCourseData.dart';
import 'entities/course/PredictedCourse.dart';
import 'entities/course/SuggestedCourseData.dart';
import 'entities/user/SchoolData.dart';
import 'entities/user/SemesterData.dart';
import 'entities/user/Teacher.dart';
import 'entities/user/UserData.dart';

class DataFetcher {
  static String _api = 'http://snf-872013.vm.okeanos.grnet.gr:3000/';

  static String token = '';
  static String refresh = '';
  HashMap<String, Course> course = new HashMap();

//  static HashMap<String, Course> courses = new HashMap();
//  static Map<String, String> searchMap = new Map();

  static Future<bool> doAuth(
    String email,
    String pwd,
    bool isLogin,
  ) async {
    var res = await http.post(
      _api + (isLogin ? "auth/login/" : "auth/signup/"),
      body: {'email': email, 'password': pwd},
    );
    if (res.statusCode != 200 && res.statusCode != 201) {
      return false;
    }
    var json = jsonDecode(res.body);
    token = json["token"];
    refresh = json["refreshToken"];
    LocalKeyValuePersistence.setUserToken(token);
    LocalKeyValuePersistence.setRefreshToken(refresh);
    return true;
  }

  static Future<bool> localAuth(lToken, lRefresh) async {
    token = lToken;
    refresh = lRefresh;
    if (token != null && refresh != null) {
      var res = await http.get(_api + "user/profile",
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
      if (res.statusCode != 200 && res.statusCode != 201) {
        return false;
      }
      return true;
    }
    return false;
  }

  static Future<List<PredictedCourse>> fetchPredictedCourses() async {
    var res = await http.get(
      _api + "course/predict/",
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (res.statusCode == 200) {
      return compute(_parsePredictedCourses, res.body);
    } else {
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

  static Future<bool> uploadGrades(String filePath) {
    return Future.value(true); // TODO send to server
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
    var res = await http.get(
      _api + "list/courses/",
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (res.statusCode == 200) {
      return compute(_parseCourses, res.body);
    } else {
      return LocalKeyValuePersistence.getMapCourses();
    }
  }

  static HashMap<String, Course> _parseCourses(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    HashMap<String, Course> instanceCourses = new HashMap();
    parsed.forEach((json) =>
        instanceCourses.putIfAbsent(json['_id'], () => Course.fromJson(json)));
    return instanceCourses;
  }

  static Future<HashMap<String, Teacher>> fetchTeachers() async {
    var res = await http.get(
      _api + "list/teachers/",
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (res.statusCode == 200) {
      return compute(_parseTeachers, res.body);
    } else {
      return LocalKeyValuePersistence.getMapTeachers();
    }
  }

  static HashMap<String, Teacher> _parseTeachers(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    HashMap<String, Teacher> instanceCourses = new HashMap();
    parsed.forEach((json) =>
        instanceCourses.putIfAbsent(json['_id'], () => Teacher.fromJson(json)));
    return instanceCourses;
  }

  static List<PredictedCourse> _parsePredictedCourses(String responseBody) {
    final Map<String, dynamic> parsed = jsonDecode(responseBody);
    List<PredictedCourse> instancePredictedCourses = new List();
    for (MapEntry entry in parsed.entries) {
      Map<String, dynamic> value = entry.value;
      value.putIfAbsent('id', () => entry.key);
      instancePredictedCourses.add(PredictedCourse.fromJson(value));
    }
    return instancePredictedCourses;
  }

  static Future<bool> changePassword(
    String prevPassword,
    String newPassword,
  ) async {
    var res = await http.patch(
      _api + "user/change_password/",
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      body: {'previousPassword': prevPassword, 'newPassword': newPassword},
    );

    return res.statusCode == 200;
  }
}

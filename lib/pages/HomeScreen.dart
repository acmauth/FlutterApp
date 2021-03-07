import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grade_plus_plus/DataFetcher.dart';
import 'package:grade_plus_plus/entities/course/Course.dart';
import 'package:grade_plus_plus/entities/user/Teacher.dart';

import '../LocalKeyValuePersistence.dart';
import '../entities/course/PredictedCourse.dart';
import '../entities/course/SuggestedCourseData.dart';
import '../entities/user/UserData.dart';
import 'AbstractPage.dart';
import 'course_suggest/CourseSuggest.dart';
import 'fragments/BlankPadding.dart';
import 'fragments/LoadingIndicator.dart';
import 'fragments/StyledText.dart';
import 'grade_predict/GradePredict.dart';
import 'search/Search.dart';
import 'settings/Settings.dart';
import 'user_profile/UserProfile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static Future<UserData> userData;
  static Future<List<SuggestedCourseData>> suggestedCourses;
  static Future<List<PredictedCourse>> predictedCourses;
  static List<AbstractPage> pages;
  static Future<HashMap<String, Course>> courses;
  static Future<HashMap<String, Teacher>> teachers;

  @override
  void initState() {
    super.initState();
//

    courses = DataFetcher.fetchCourses();
    teachers = DataFetcher.fetchTeachers();
    userData = DataFetcher.fetchUserData();
    predictedCourses = DataFetcher.fetchPredictedCourses();


    _loadLocalData(); // See the to-do below
  }

  _loadLocalData() {
    // TODO: We can implement this inside their call in data fetcher as the DataFetcher.fetchCourses is implemented
    Future<List<dynamic>> sc =
        LocalKeyValuePersistence.getListSuggestedCourses();

    setState(() {
      suggestedCourses = sc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait(
              [userData, suggestedCourses, predictedCourses, courses, teachers])
          .then(
        (response) => new Merged(
            userData: response[0],
            suggestedCourses: response[1],
            predictedCourses: response[2],
            courses: response[3],
            teachers: response[4]),
      ),
      builder: (BuildContext context, AsyncSnapshot<Merged> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          pages = <AbstractPage>[
            GradePredict(
                predictedCourses: snapshot.data.predictedCourses,
                courses: snapshot.data.courses),
            CourseSuggest(
              userData: snapshot.data.userData,
              suggestedCourses: snapshot.data.suggestedCourses,
            ),
            Search(courses: snapshot.data.courses),
            UserProfile(
                userData: snapshot.data.userData,
                courses: snapshot.data.courses,
                teachers: snapshot.data.teachers),
            Settings(),
          ];

          // Since we receive data here, it is time to save them!
          LocalKeyValuePersistence.setUserData(snapshot.data.userData);
          LocalKeyValuePersistence.setListPredictedCourses(
              snapshot.data.predictedCourses);
          LocalKeyValuePersistence.setListSuggestedCourses(
              snapshot.data.suggestedCourses);
          LocalKeyValuePersistence.setMapCourses(snapshot.data.courses);
          LocalKeyValuePersistence.setMapTeachers(snapshot.data.teachers);

          return DefaultTabController(
            length: pages.length,
            child: Scaffold(
              body: TabBarView(children: pages),
              bottomNavigationBar: Container(
                color: Theme.of(context).bottomAppBarColor,
                child: TabBar(
                  indicatorColor: Theme.of(context).bottomAppBarColor,
                  tabs: pages
                      .map((AbstractPage p) => Tab(icon: Icon(p.navIcon)))
                      .toList(),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          // This is not tested
          children = <Widget>[
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ];
        } else {
          children = [
            LoadingIndicator(),
            BlankPadding(),
            StyledText("Loading..."),
          ];
        }
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          ),
        );
      },
    );
  }
}

class Merged {
  final UserData userData;
  final List<SuggestedCourseData> suggestedCourses;
  final List<PredictedCourse> predictedCourses;
  final HashMap<String, Course> courses;
  final HashMap<String, Teacher> teachers;

  Merged(
      {this.userData,
      this.suggestedCourses,
      this.predictedCourses,
      this.courses,
      this.teachers});
}

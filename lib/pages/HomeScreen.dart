import 'package:flutter/material.dart';
import 'package:grade_plus_plus/LocalKeyValuePersistence.dart';

import '../DataFetcher.dart';
import '../entities/course/SuggestedCourseData.dart';
import '../entities/user/UserData.dart';
import 'AbstractPage.dart';
import 'course_suggest/CourseSuggest.dart';
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
  static UserData userData = DataFetcher.fetchUserData();
  static List<SuggestedCourseData> suggestedCourses =
      DataFetcher.fetchSuggestedCourses();

  final List<AbstractPage> pages = <AbstractPage>[
    GradePredict(),
    CourseSuggest(
      schoolData: userData.schoolData,
      suggestedCourses: suggestedCourses,
    ),
    Search(),
    UserProfile(userData: userData),
    Settings(),
  ];

  _HomeScreenState() {
    LocalKeyValuePersistence.setUserData(userData);
    LocalKeyValuePersistence.setListSuggestedCourses(suggestedCourses);
  }

  @override
  Widget build(BuildContext context) {
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
  }
}

import 'package:flutter/material.dart';
import 'package:grade_plus_plus/LocalKeyValuePersistence.dart';

import '../LocalKeyValuePersistence.dart';
import '../entities/course/PredictedCourse.dart';
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
  static Future<UserData> userData;
  static Future<List<SuggestedCourseData>> suggestedCourses;
  static Future<List<PredictedCourse>> predictedCourses;
  static List<AbstractPage> pages;

  @override
  void initState() {
    super.initState();
    // When then data is loaded from disk needs to be determined after we complete communication with server.
    // This actually needs to be reversed
    _loadLocalData();
  }

  _loadLocalData() {
    Future<UserData> ud = LocalKeyValuePersistence.getUserData();
    Future<List<dynamic>> sc =
        LocalKeyValuePersistence.getListSuggestedCourses();
    Future<List<dynamic>> pc =
        LocalKeyValuePersistence.getListPredictedCourses();
    setState(() {
      userData = ud;
      suggestedCourses = sc;
      predictedCourses = pc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([userData, suggestedCourses, predictedCourses]).then(
        (response) => new Merged(
            userData: response[0],
            suggestedCourses: response[1],
            predictedCourses: response[2]),
      ),
      builder: (BuildContext context, AsyncSnapshot<Merged> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          pages = <AbstractPage>[
            GradePredict(gradeData: snapshot.data.predictedCourses),
            CourseSuggest(
              userData: snapshot.data.userData,
              suggestedCourses: snapshot.data.suggestedCourses,
            ),
            Search(),
            UserProfile(userData: snapshot.data.userData),
            Settings(),
          ];

          // Since we receive data here, it is time to save them!
          LocalKeyValuePersistence.setUserData(snapshot.data.userData);
          LocalKeyValuePersistence.setListPredictedCourses(
              snapshot.data.predictedCourses);
          LocalKeyValuePersistence.setListSuggestedCourses(
              snapshot.data.suggestedCourses);

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
          // TODO This needs ui fixing
          return CircularProgressIndicator(
            backgroundColor: Colors.blue,
            strokeWidth: 5,
          );
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
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

  Merged({this.userData, this.suggestedCourses, this.predictedCourses});
}

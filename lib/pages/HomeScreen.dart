import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/AbstractPage.dart';
import 'package:grade_plus_plus/pages/exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<AbstractPage> pages = <AbstractPage>[
    GradePredict(),
    CourseSuggest(
      semester: SemesterData(
        school: 'Computer Science',
        semester: 5,
      ),
      courses: <CourseData>[
        CourseData(
          title: 'Foundations of Cryptography',
          code: 'NGE-06-03',
          match: 85,
          teacher: 'Konstantinos Draziotis',
          averageGrade: 8,
          difficulty: CourseDifficulty.MEDIUM,
          favTeacher: true,
        ),
        CourseData(
          title: 'Mobile Device Interfaces',
          code: 'NET-06-01',
          match: 65,
          teacher: 'Thrasyvolus Tsiatsos',
          averageGrade: 9.5,
          difficulty: CourseDifficulty.EASY,
          favTeacher: false,
        ),
        CourseData(
          title: 'Computer Graphics',
          code: 'NDM-07-04',
          match: 55,
          teacher: 'Nikos Nikolaidis',
          averageGrade: 7,
          difficulty: CourseDifficulty.HARD,
          favTeacher: false,
        ),
      ],
    ),
    Search(),
    UserProfile(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pages.length,
      child: Scaffold(
        body: TabBarView(children: pages),
        bottomNavigationBar: TabBar(
          tabs: // TODO(dinos): Remove navItem from AbstractPage to map without this hack.
              pages.map((AbstractPage p) => Tab(icon: p.navItem.icon)).toList(),
          unselectedLabelColor: Theme.of(context).bottomAppBarColor,
          labelColor: Colors.blue,
          indicatorColor: Colors.blue,
        ),
      ),
    );
  }
}

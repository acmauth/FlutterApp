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
    CourseSuggest(),
    Search(),
    UserProfile(),
    SettingsPage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final AbstractPage page = pages[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(page.appBarTitle),
      ),
      body: SingleChildScrollView(child: page),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() => _currentIndex = index),
        items: pages.map((AbstractPage p) => p.navItem).toList(),
      ),
    );
  }
}

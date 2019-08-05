import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/exports.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pages = [
    GradePredict(),
    CourseSuggest(),
    Search(),
    UserProfile(),
    SettingsPage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final page = pages[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(page.appBarTitle),
      ),
      body: SingleChildScrollView(child: page),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: pages.map((p) => p.navItem).toList(),
      ),
    );
  }
}

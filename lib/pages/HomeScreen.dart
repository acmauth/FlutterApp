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

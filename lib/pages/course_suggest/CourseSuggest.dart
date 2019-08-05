import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/AbstractPage.dart';

class CourseSuggest extends AbstractPage {
  CourseSuggest({Key key})
      : super(
          key: key,
          appBarTitle: "Course Suggestion",
          content: RaisedButton(
            onPressed: () {},
            child: Text("todo"),
          ),
          navItem: BottomNavigationBarItem(
            icon: new Icon(Icons.check_circle),
            title: Text("Courses"),
          ),
        );
}

import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/AbstractPage.dart';

class GradePredict extends AbstractPage {
  GradePredict({Key key})
      : super(
          key: key,
          appBarTitle: "Grade Prediction",
          content: RaisedButton(
            onPressed: () {},
            child: Text("todo"),
          ),
          navItem: BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: Text("Grades"),
          ),
        );
}

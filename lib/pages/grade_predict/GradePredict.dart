import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grade_plus_plus/entities/course/Course.dart';

import '../../LocalKeyValuePersistence.dart';
import '../../entities/course/CourseDifficulty.dart';
import '../../entities/course/PredictedCourse.dart';
import '../AbstractPage.dart';
import '../fragments/BlankPadding.dart';
import '../fragments/ChartBar.dart';
import '../fragments/ChartLabel.dart';
import '../fragments/StyledText.dart';

class GradePredict extends AbstractPage {
  GradePredict(
      {Key key, @required this.predictedCourses, @required this.courses})
      : super(
          key: key,
          appBarTitle: 'Grade Prediction',
          navIcon: Icons.equalizer,
        );

  final HashMap<String, Course> courses;
  final List<PredictedCourse> predictedCourses;

  _GradePredictState createState() => _GradePredictState();
}

class _GradePredictState extends PageState<GradePredict> {
  PredictedCourse _shownCourse;

  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    if (widget.predictedCourses.length > 0) {
      if (_shownCourse == null) {
        _shownCourse = widget.predictedCourses[0];
      }
      LocalKeyValuePersistence.setListPredictedCourses(widget.predictedCourses);
      Course course = widget.courses[_shownCourse.courseID];
      return Column(
        children: <Widget>[
          DropdownButton(
            value: _shownCourse,
            onChanged: (newValue) {
              setState(() {
                _shownCourse = newValue;
              });
            },
            items: widget.predictedCourses.map((predictedCourse) {
              return DropdownMenuItem(
                child: new Text(widget.courses[predictedCourse.courseID].title),
                value: predictedCourse,
              );
            }).toList(),
          ),
          _buildGradePredictionPage(_shownCourse, course),
        ],
      );
    } else {
      return Column(children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 5,bottom: 5),
          child: Column(
            children: <Widget>[
              BlankPadding(),
              Image.asset(
                'assets/fireworks.png',
                height: 200,
                width: 200,
              ),
              BlankPadding(),
              StyledText(
                "Aren't you amazing?",
                size: 18,
                weight: FontWeight.bold,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: StyledText(
                  "You seem to be an excellent student! You have succeeded in all "
                  "the courses we provide predictions for.",
                  size: 14,
                  align: TextAlign.justify,
                ),
              ),
              BlankPadding(),
              Image.asset(
                'assets/clock.png',
                height: 100,
                width: 100,
              ),
              BlankPadding(),
              StyledText(
                "Come back later!",
                size: 18,
                weight: FontWeight.bold,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: StyledText(
                  "We are constantly updating our prediction models and your "
                  "remaining courses will appear here.",
                  size: 14,
                  align: TextAlign.justify,
                ),
              )
            ],
          ),
        )
      ]);
    }
  }

  Widget _buildGradePredictionPage(
      PredictedCourse predictedCourse, Course course) {
    List<int> histogram = course.courseMetrics.histogram;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Theme.of(context).cardColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("${course.code}",
                      style: TextStyle(fontSize: 25, color: Theme.of(context).textTheme.subtitle.color)),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text("${course.title}",
                      style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).textTheme.title.color,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text("${course.teacher}",
                      style: TextStyle(fontSize: 13, color: Theme.of(context).textTheme.subtitle.color)),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Grade Prediction: ${predictedCourse.gradePrediction}",
                      style: TextStyle(fontSize: 17, color: Theme.of(context).textTheme.body1.color)),
                  SizedBox(
                    height: 5.0,
                  ),
                  StyledText("Difficulty: ",color: Theme.of(context).textTheme.body1.color),
                  StyledText(
                    _getDifficultyText(course.courseMetrics.difficulty),
                    color: _getDifficultyColor(course.courseMetrics.difficulty),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                      "This grade is above ${(predictedCourse.distribution).toStringAsFixed(2)}% of all students!",
                      style: TextStyle(fontSize: 17, color: Theme.of(context).textTheme.body1.color))
                ],
              )),
          BlankPadding(),
          StyledText(
            "Grade Destribution",
            size: 20,
            weight: FontWeight.bold,
            color: Theme.of(context).textTheme.body1.color,
          ),
          StyledText(
              "Based on ${course.courseMetrics.enrolled} students so far", color: Theme.of(context).textTheme.body1.color,),
          BlankPadding(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              ChartBar(height: 10 * histogram[0].toDouble()),
              ChartBar(height: 10 * histogram[1].toDouble()),
              ChartBar(height: 10 * histogram[2].toDouble()),
              ChartBar(height: 10 * histogram[3].toDouble()),
              ChartBar(height: 10 * histogram[4].toDouble()),
              ChartBar(height: 10 * histogram[5].toDouble()),
              ChartBar(height: 10 * histogram[6].toDouble()),
              ChartBar(height: 10 * histogram[7].toDouble()),
              ChartBar(height: 10 * histogram[8].toDouble()),
              ChartBar(height: 10 * histogram[9].toDouble()),
            ],
          ),
          Row(
//          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ChartLabel("1"),
              ChartLabel("2"),
              ChartLabel("3"),
              ChartLabel("4"),
              ChartLabel("5"),
              ChartLabel("6"),
              ChartLabel("7"),
              ChartLabel("8"),
              ChartLabel("9"),
              ChartLabel("10"),
            ],
          ),
        ],
      ),
    );
  }
}

String _getDifficultyText(CourseDifficulty difficulty) {
  switch (difficulty) {
    case CourseDifficulty.EASY:
      return "Easy";
    case CourseDifficulty.MEDIUM:
      return "Medium";
    case CourseDifficulty.HARD:
      return "Hard";
    default:
      return "Unmapped value";
  }
}

Color _getDifficultyColor(CourseDifficulty difficulty) {
  switch (difficulty) {
    case CourseDifficulty.EASY:
      return Colors.green;
    case CourseDifficulty.MEDIUM:
      return Colors.orange;
    case CourseDifficulty.HARD:
      return Colors.red;
    case CourseDifficulty.VERY_HARD:
      return Colors.black;
    default:
      return Colors.black;
  }
}

import 'package:flutter/material.dart';

import '../../entities/course/CourseDifficulty.dart';
import '../../entities/course/PredictedCourse.dart';
import '../AbstractPage.dart';
import '../fragments/BlankPadding.dart';
import '../fragments/ChartBar.dart';
import '../fragments/ChartLabel.dart';
import '../fragments/StyledText.dart';

class GradePredict extends AbstractPage {
  GradePredict({
    Key key,
    @required this.gradeData,
  }) : super(
          key: key,
          appBarTitle: 'Grade Prediction',
          navIcon: Icons.equalizer,
        );
  final List<PredictedCourse> gradeData;

  _GradePredictState createState() => _GradePredictState();
}

class _GradePredictState extends PageState<GradePredict> {
  PredictedCourse _shownCourse;

  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    if (_shownCourse == null) {
      _shownCourse = widget.gradeData[0];
    }

    return Column(
      children: <Widget>[
        DropdownButton(
          value: _shownCourse,
          onChanged: (newValue) {
            setState(() {
              _shownCourse = newValue;
            });
          },
          items: widget.gradeData.map((course) {
            return DropdownMenuItem(
              child: new Text(course.courseName),
              value: course,
            );
          }).toList(),
        ),
        _buildGradePredictionPage(_shownCourse),
      ],
    );
  }

  Widget _buildGradePredictionPage(PredictedCourse course) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.lightBlue[50],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("${course.courseCode}",
                      style: TextStyle(fontSize: 25, color: Colors.blue[600])),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text("${course.courseName}",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue[600],
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text("${course.courseTeacher}",
                      style: TextStyle(fontSize: 13, color: Colors.blue[600])),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Grade Prediction: ${course.gradePrediction}",
                      style: TextStyle(fontSize: 17, color: Colors.blue[600])),
                  SizedBox(
                    height: 5.0,
                  ),
                  StyledText("Difficulty: "),
                  StyledText(
                    _getDifficultyText(course.difficulty),
                    color: _getDifficultyColor(course.difficulty),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                      "This grade is above ${course.gradePercentage} of all students!",
                      style: TextStyle(fontSize: 17, color: Colors.blue[600]))
                ],
              )),
          BlankPadding(),
          StyledText(
            "Grade Destribution",
            size: 20,
            weight: FontWeight.bold,
          ),
          StyledText("Based on ${course.enrolledStudents} students so far"),
          BlankPadding(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              ChartBar(height: course.box1),
              ChartBar(height: course.box2),
              ChartBar(height: course.box3),
              ChartBar(height: course.box4),
              ChartBar(height: course.box5),
              ChartBar(height: course.box6),
              ChartBar(height: course.box7),
              ChartBar(height: course.box8),
              ChartBar(height: course.box9),
              ChartBar(height: course.box10),
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
    default:
      return Colors.black;
  }
}

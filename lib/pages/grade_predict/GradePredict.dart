import 'package:flutter/material.dart';

import '../AbstractPage.dart';
import '../../entities/course/PredictedCourse.dart';
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
  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    return Column(
      children: <Widget>[
        _buildGradePredictionPage(widget.gradeData),
      ],
    );
  }
}

Widget _buildGradePredictionPage(List<PredictedCourse> data){
  final Iterable<Column> courses = data.map(
    (PredictedCourse course) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(15),
          height: 50,
          color: Colors.lightBlue[50],
        ),
        Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.only(left: 30,bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.lightBlue[50],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.0,),
                Text("${course.courseCode}",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue[600]
                    )
                ),
                SizedBox(height: 5.0,),
                Text("${course.courseName}",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue[600],
                        fontWeight: FontWeight.bold
                    )
                ),
                SizedBox(height: 2.0,),
                Text("${course.courseTeacher}",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.blue[600]
                    )
                ),
                SizedBox(height: 20.0,),
                Text("Grade Prediction: ${course.gradePrediction}",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.blue[600]
                    )
                ),
                SizedBox(height: 5.0,),
                StyledText("Difficulty: "),
                StyledText(
                  _getDifficultyText(course.difficulty),
                  color: _getDifficultyColor(course.difficulty),
                ),
                SizedBox(height: 20.0,),
                Text("This grade is above ${course.gradePercentage} of all students!",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.blue[600]
                    )
                )
              ],
            )
        ),
        SizedBox(height: 20.0,),
        Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Text("Grade Destribution",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue[600],
                  fontWeight: FontWeight.bold
              )
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Text("Based on ${course.enrolledStudents} students so far",
            style: TextStyle(
                fontSize: 14,
                color: Colors.blue[600]
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 30.0,right: 30.0,top: 40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  width: 10,
                  height: course.box1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1),
                      colors: [ Colors.blue, Colors.lightBlue[50],], // whitish to gray
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.all(1.0),
                  width: 10,
                  height: course.box2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1),
                      colors: [ Colors.blue, Colors.lightBlue[50],], // whitish to gray
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.all(1.0),
                  width: 10,
                  height: course.box3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1),
                      colors: [ Colors.blue, Colors.lightBlue[50],], // whitish to gray
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(1.0),
                  width: 10,
                  height: course.box4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1),
                      colors: [ Colors.blue, Colors.lightBlue[50],], // whitish to gray
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(1.0),
                  width: 10,
                  height: course.box5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1),
                      colors: [ Colors.blue, Colors.lightBlue[50],], // whitish to gray
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(1.0),
                  width: 10,
                  height: course.box6,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1),
                      colors: [ Colors.blue, Colors.lightBlue[50],], // whitish to gray
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(1.0),
                  width: 10,
                  height: course.box7,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1),
                      colors: [ Colors.blue, Colors.lightBlue[50],], // whitish to gray
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(1.0),
                  width: 10,
                  height: course.box8,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1),
                      colors: [ Colors.blue, Colors.lightBlue[50],], // whitish to gray
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(1.0),
                  width: 10,
                  height: course.box9,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1),
                      colors: [ Colors.blue, Colors.lightBlue[50],], // whitish to gray
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(1.0),
                  width: 10,
                  height: course.box10,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1),
                      colors: [ Colors.blue, Colors.lightBlue[50],], // whitish to gray
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 30.0,right: 30.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  width: 10,
                  child: Text("1",
                    style:TextStyle(fontSize: 10.0,color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 10,
                  child: Text("2",
                      style:TextStyle(fontSize: 10.0,color: Colors.blue),
                      textAlign: TextAlign.center
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 10,
                  child: Text("3",
                      style:TextStyle(fontSize: 10.0,color: Colors.blue),
                      textAlign: TextAlign.center
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 10,
                  child: Text("4",
                      style:TextStyle(fontSize: 10.0,color: Colors.blue),
                      textAlign: TextAlign.center
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 10,
                  child: Text("5",
                      style:TextStyle(fontSize: 10.0,color: Colors.blue),
                      textAlign: TextAlign.center
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 10,
                  child: Text("6",
                      style:TextStyle(fontSize: 10.0,color: Colors.blue),
                      textAlign: TextAlign.center
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 10,
                  child: Text("7",
                      style:TextStyle(fontSize: 10.0,color: Colors.blue),
                      textAlign: TextAlign.center
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 10,
                  child: Text("8",
                      style:TextStyle(fontSize: 10.0,color: Colors.blue),
                      textAlign: TextAlign.center
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 10,
                  child: Text("9",
                      style:TextStyle(fontSize: 10.0,color: Colors.blue),
                      textAlign: TextAlign.center
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    width: 10,
                    child: Text("10",
                        style:TextStyle(fontSize: 10.0,color: Colors.blue),
                        textAlign: TextAlign.center
                    ),
                  )
              ),
            ],
          ),
        ),
        SizedBox(height: 20,)
      ],
    )
  );

  return Column(
    children: courses.toList(),
  );
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

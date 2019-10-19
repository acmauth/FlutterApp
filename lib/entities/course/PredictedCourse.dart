import 'package:meta/meta.dart';

class PredictedCourse {
  const PredictedCourse({
    @required this.courseCode,
    @required this.courseName,
    @required this.courseTeacher,
    @required this.gradePrediction,
    @required this.difficulty,
    @required this.gradePercentage,
    @required this.enrolledStudents,

    @required this.box1,
    @required this.box2,
    @required this.box3,
    @required this.box4,
    @required this.box5,
    @required this.box6,
    @required this.box7,
    @required this.box8,
    @required this.box9,
    @required this.box10,
  });

  final String courseCode;
  final String courseName;
  final String courseTeacher;
  final double gradePrediction;
  final CourseDifficulty difficulty;
  final double gradePercentage;
  final int enrolledStudents;

  final double box1;
  final double box2;
  final double box3;
  final double box4;
  final double box5;
  final double box6;
  final double box7;
  final double box8;
  final double box9;
  final double box10;
}

enum CourseDifficulty {
  EASY, MEDIUM, HARD,
}

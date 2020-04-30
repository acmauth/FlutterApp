import 'package:meta/meta.dart';

class PassedCourse {
  PassedCourse({
    @required this.courseID,
    @required this.grade,
    @required this.year,
  });

  final String courseID;
  final double grade;
  final String year;

  factory PassedCourse.fromJson(Map<String, dynamic> json) {
    return PassedCourse(
        courseID: json['_id'] as String,
        grade: json['grade'].toDouble() as double,
        year: json['year_passed'] as String);
  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'_id': courseID, 'grade': grade, 'year_passed': year};
}

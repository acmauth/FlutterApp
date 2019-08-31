import 'package:grade_plus_plus/pages/course_suggest/CourseDifficulty.dart';

class CourseData {
  const CourseData({
    this.title,
    this.code,
    this.match,
    this.teacher,
    this.averageGrade,
    this.difficulty,
    this.favTeacher,
  });

  final String title;
  final String code;
  final int match;
  final String teacher;
  final double averageGrade;
  final CourseDifficulty difficulty;
  final bool favTeacher;
}

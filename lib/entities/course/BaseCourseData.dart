import 'package:meta/meta.dart';

class BaseCourseData {
  const BaseCourseData({
    @required this.title,
    @required this.code,
    @required this.teacher,
    @required this.averageGrade,
    @required this.difficulty,
  });

  final String title;
  final String code;
  final String teacher;
  final double averageGrade;
  final CourseDifficulty difficulty;
}

enum CourseDifficulty {
  EASY,
  MEDIUM,
  HARD,
}

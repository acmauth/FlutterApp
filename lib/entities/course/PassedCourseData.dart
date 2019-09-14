import 'package:meta/meta.dart';

import 'BaseCourseData.dart';

class PassedCourseData {
  const PassedCourseData({
    @required this.baseData,
    @required this.grade,
    @required this.year,
  });

  final BaseCourseData baseData;
  final double grade;
  final String year;
}

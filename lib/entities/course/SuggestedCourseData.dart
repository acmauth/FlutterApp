import 'package:meta/meta.dart';

import 'BaseCourseData.dart';

class SuggestedCourseData {
  const SuggestedCourseData({
    @required this.baseData,
    @required this.match,
    this.favTeacher = false,
  });

  final BaseCourseData baseData;
  final int match;
  final bool favTeacher;
}

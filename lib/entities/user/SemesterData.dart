import 'package:meta/meta.dart';

import '../course/PassedCourseData.dart';

class SemesterData {
  SemesterData({
    @required this.id,
    @required this.courseDataList,
  });

  final int id;
  final List<PassedCourseData> courseDataList;
}

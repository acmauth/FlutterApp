import 'package:grade_plus_plus/entities/course/CourseClass.dart';
import 'package:grade_plus_plus/entities/course/CourseExtra.dart';
import 'package:meta/meta.dart';

import 'CourseMetrics.dart';

class Course {
  Course(
      {@required this.id,
      @required this.code,
      @required this.title,
      @required this.teacher,
      @required this.period,
      @required this.courseClass,
      @required this.courseExtra,
      @required this.courseMetrics});

  final String id;
  final String code;
  final String title;
  final int period;
  final String teacher;
  final CourseClass courseClass;
  final CourseExtra courseExtra;
  final CourseMetrics courseMetrics;

  factory Course.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> basicInfo = json['basic_info'];
    int semester = int.parse((basicInfo['code'] as String).split("-")[1]);
    return Course(
      id: basicInfo['_id'] as String,
      code: basicInfo['code'] as String,
      title: basicInfo['name'] as String,
      period: semester,
      teacher: basicInfo['teacher'] as String,
      courseClass: basicInfo['class'] == null
          ? null
          : CourseClass.fromJson(basicInfo['class'] as Map<String, dynamic>),
      courseExtra: json['extra_data'] == null
          ? null
          : CourseExtra.fromJson(json['extra_data'] as Map<String, dynamic>),
      courseMetrics: json['metrics'] == null
          ? null
          : CourseMetrics.fromJson(json['metrics'] as Map<String, dynamic>),
    );
  }
}

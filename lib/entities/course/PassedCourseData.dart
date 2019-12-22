import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'BaseCourseData.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PassedCourseData.g.dart';

@JsonSerializable(explicitToJson: true)

part 'PassedCourseData.g.dart';

@JsonSerializable(explicitToJson: true)

class PassedCourseData {
  const PassedCourseData({
    @required this.baseData,
    @required this.grade,
    @required this.year,
  });

  final BaseCourseData baseData;
  final double grade;
  final String year;

  factory PassedCourseData.fromJson(Map<String, dynamic> json) =>
      _$PassedCourseDataFromJson(json);

  Map<String, dynamic> toJson() => _$PassedCourseDataToJson(this);
}

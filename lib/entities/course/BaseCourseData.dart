import 'package:meta/meta.dart';

import 'package:json_annotation/json_annotation.dart';

part 'BaseCourseData.g.dart';

@JsonSerializable(explicitToJson: true)


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


  factory BaseCourseData.fromJson(Map<String, dynamic> json) =>
      _$BaseCourseDataFromJson(json);

  Map<String, dynamic> toJson() => _$BaseCourseDataToJson(this);
}

enum CourseDifficulty {
  EASY,
  MEDIUM,
  HARD,
}

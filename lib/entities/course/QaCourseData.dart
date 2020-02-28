import 'package:json_annotation/json_annotation.dart';

import 'package:meta/meta.dart';

import 'BaseCourseData.dart';

part 'QaCourseData.g.dart';

@JsonSerializable(explicitToJson: true)
class QaCourseData {
  QaCourseData({
    @required this.base,
    @required this.period,
    @required this.year,
    @required this.teachers,
    @required this.erasmus,
    @required this.goal,
    @required this.content,
    @required this.assessDesc,
    @required this.assessMethods,
    @required this.preCourses,
    @required this.preKnowledge,
  });

  final BaseCourseData base;
  final int period;
  final String year;
  final List<String> teachers;
  final bool erasmus;
  final String goal;
  final String assessDesc;
  final List<String> assessMethods;
  final List<String> content;
  final List<String> preCourses;
  final List<String> preKnowledge;

  factory QaCourseData.fromJson(Map<String, dynamic> json) =>
      _$QaCourseDataFromJson(json);

  Map<String, dynamic> toJson() => _$QaCourseDataToJson(this);
}

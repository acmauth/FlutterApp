import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'BaseCourseData.dart';

part 'SuggestedCourseData.g.dart';

@JsonSerializable(explicitToJson: true)

class SuggestedCourseData {
  const SuggestedCourseData({
    @required this.baseData,
    @required this.match,
    this.favTeacher = false,
  });

  final BaseCourseData baseData;
  final int match;
  final bool favTeacher;

  factory SuggestedCourseData.fromJson(Map<String, dynamic> json) =>
      _$SuggestedCourseDataFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestedCourseDataToJson(this);
}

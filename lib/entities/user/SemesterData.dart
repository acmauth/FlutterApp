import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../course/PassedCourseData.dart';

part 'SemesterData.g.dart';

@JsonSerializable(explicitToJson: true)

class SemesterData {
  SemesterData({
    @required this.id,
    @required this.courseDataList,
  });

  final int id;
  final List<PassedCourseData> courseDataList;

  factory SemesterData.fromJson(Map<String, dynamic> json) =>
      _$SemesterDataFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterDataToJson(this);
}

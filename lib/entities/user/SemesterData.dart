import 'package:grade_plus_plus/entities/course/PassedCourse.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'SemesterData.g.dart';

@JsonSerializable(explicitToJson: true)
class SemesterData {
  SemesterData({
    @required this.id,
    @required this.courses,
  });

  final int id;
  final List<PassedCourse> courses;

  factory SemesterData.fromJson(Map<String, dynamic> json) =>
      _$SemesterDataFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterDataToJson(this);
}

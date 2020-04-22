import 'package:json_annotation/json_annotation.dart';

import 'package:meta/meta.dart';

part 'CourseClass.g.dart';


@JsonSerializable(explicitToJson: true)


class CourseClass {
  CourseClass({@required this.teachers, @required this.year});

  final List<String> teachers;
  final String year;

  factory CourseClass.fromJson(Map<String, dynamic> json) =>
      _$CourseClassFromJson(json);

  Map<String, dynamic> toJson() => _$CourseClassToJson(this);
}

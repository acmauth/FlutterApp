import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'Teacher.g.dart';

@JsonSerializable(explicitToJson: true)
class Teacher {
  Teacher({@required this.id, @required this.name, @required this.courses});

  final String id;
  final String name;
  final List<String> courses;

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherToJson(this);
}

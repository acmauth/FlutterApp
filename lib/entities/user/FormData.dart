import 'package:json_annotation/json_annotation.dart';

part 'FormData.g.dart';

@JsonSerializable(explicitToJson: true)


class FormData {
  FormData({
    this.name,
    this.school,
    this.reason,
    this.studyTime,
    this.lectures,
    this.privateLessons,
    this.postGraduate,
    this.roommate,
    this.distance,
    this.hobbies,
    this.semester,
    this.gradesPath,
  });


  String name;
  String school;
  String reason;
  String studyTime;
  String lectures;
  bool privateLessons;
  String postGraduate;
  String roommate;
  String distance;
  List<String> hobbies;
  int semester;
  String gradesPath;

  factory FormData.fromJson(Map<String, dynamic> json) => _$FormDataFromJson(json);

  Map<String, dynamic> toJson() => _$FormDataToJson(this);

}

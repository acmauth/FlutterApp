import 'package:json_annotation/json_annotation.dart';

part 'FormData.g.dart';

@JsonSerializable(explicitToJson: true)


class FormData {
  FormData({
    this.name,
    this.school,
    this.semester,
    this.reason,
    this.studyTime,
    this.lectures,
    this.privateLessons,
    this.postgraduate,
    this.roomates,
    this.distance,
    this.hobbies,
  });


  String name;
  String school;
  int semester;
  String reason;
  int studyTime;
  String lectures;
  bool privateLessons;
  String postgraduate;
  String roomates;
  String distance;
  List<String> hobbies;

  factory FormData.fromJson(Map<String, dynamic> json) => _$FormDataFromJson(json);

  Map<String, dynamic> toJson() => _$FormDataToJson(this);

}

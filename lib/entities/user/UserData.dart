import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'SchoolData.dart';
import 'SemesterData.dart';
import 'UserCredentials.dart';

part 'UserData.g.dart';

@JsonSerializable(explicitToJson: true)
// If you make changes to this calss & there are any errors please check
// https://flutter.dev/docs/development/data-and-backend/json#serializing-json-using-code-generation-libraries

class UserData {
  UserData({
    this.userCreds,
    this.name,
    @required this.estYear,
    @required this.schoolData,
    @required this.favSubjects,
    @required this.favTeachers,
    @required this.semesterDataList,
  });

  String name;
  UserCredentials userCreds;
  final int estYear;
  final SchoolData schoolData;
  final List<String> favSubjects;
  final List<String> favTeachers;
  final List<SemesterData> semesterDataList;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

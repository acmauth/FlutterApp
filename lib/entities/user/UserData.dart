import 'package:grade_plus_plus/entities/course/PassedCourse.dart';
import 'package:meta/meta.dart';

import 'SchoolData.dart';

//@JsonSerializable(explicitToJson: true)
//// If you make changes to this calss & there are any errors please check
//// https://flutter.dev/docs/development/data-and-backend/json#serializing-json-using-code-generation-libraries

class UserData {
  UserData({
    this.name,
    this.semester,
    @required this.schoolData,
    @required this.favSubjects,
    @required this.favTeachers,
    @required this.passedCourses,
  });

  String name;
  int semester;
  final SchoolData schoolData;
  final List<String> favSubjects;
  final List<String> favTeachers;
  final List<PassedCourse> passedCourses;

  factory UserData.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> bio = json['bio'];

    return UserData(
      name: bio['name'] as String,
      semester: bio['semester'] as int,
      schoolData:
          bio == null ? null : SchoolData.fromJson(bio as Map<String, dynamic>),
      favSubjects: (json['favorite_subjects'] as List)
          ?.map((e) => e as String)
          ?.toList(),
      favTeachers: (json['favorite_teachers'] as List)
          ?.map((e) => e as String)
          ?.toList(),
      passedCourses: (json['grades'] as List)
          ?.map((e) => PassedCourse.fromJson(e))
          ?.toList(),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bio': <String, dynamic>{
          'name': name,
          'semester': semester,
          'school': schoolData?.toJson()
        },
        'favorite_subjects': favSubjects,
        'favorite_teachers': favTeachers,
        'grades': passedCourses
      };
}

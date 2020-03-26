// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FormData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormData _$FormDataFromJson(Map<String, dynamic> json) {
  return FormData(
    name: json['name'] as String,
    school: json['school'] as String,
    reason: json['reason'] as String,
    studyTime: json['studyTime'] as String,
    lectures: json['lectures'] as String,
    privateLessons: json['privateLessons'] as bool,
    postGraduate: json['postGraduate'] as String,
    roommate: json['roommate'] as String,
    distance: json['distance'] as String,
    hobbies: (json['hobbies'] as List)?.map((e) => e as String)?.toList(),
    semester: json['semester'] as int,
    gradesPath: json['gradesPath'] as String,
  );
}

Map<String, dynamic> _$FormDataToJson(FormData instance) => <String, dynamic>{
  'name': instance.name,
  'school': instance.school,
  'reason': instance.reason,
  'studyTime': instance.studyTime,
  'lectures': instance.lectures,
  'privateLessons': instance.privateLessons,
  'postGraduate': instance.postGraduate,
  'roommate': instance.roommate,
  'distance': instance.distance,
  'hobbies': instance.hobbies,
  'semester': instance.semester,
  'gradesPath': instance.gradesPath,
};

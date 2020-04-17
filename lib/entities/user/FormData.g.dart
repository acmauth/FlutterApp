// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FormData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormData _$FormDataFromJson(Map<String, dynamic> json) {
  return FormData(
    name: json['name'] as String,
    school: json['school'] as String,
    semester: json['semester'] as int,
    reason: json['reason'] as String,
    studyTime: json['study_time'] as int,
    lectures: json['lectures'] as String,
    privateLessons: json['privateLessons'] as bool,
    postgraduate: json['postgraduate'] as String,
    roomates: json['roomates'] as String,
    distance: json['distance'] as String,
    hobbies: (json['hobbies'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$FormDataToJson(FormData instance) => <String, dynamic>{
      'name': instance.name,
      'school': instance.school,
      'semester': instance.semester,
      'reason': instance.reason,
      'study_time': instance.studyTime,
      'lectures': instance.lectures,
      'privateLessons': instance.privateLessons.toString(),
      'postgraduate': instance.postgraduate,
      'roomates': instance.roomates,
      'distance': instance.distance,
      'hobbies': instance.hobbies,
    };

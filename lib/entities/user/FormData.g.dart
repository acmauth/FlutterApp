// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FormData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormData _$FormDataFromJson(Map<String, dynamic> json) {
  return FormData(
    age: json['age'] as int,
    reason: json['reason'] as String,
    studyTime: json['studyTime'] as String,
    lectures: json['lectures'] as String,
    privateLessons: json['privateLessons'] as bool,
    postGraduate: json['postGraduate'] as String,
    roommate: json['roommate'] as String,
    distance: json['distance'] as String,
    hobbies: (json['hobbies'] as List)?.map((e) => e as String)?.toList(),
    semester: json['semester'] as int,
  );
}

Map<String, dynamic> _$FormDataToJson(FormData instance) => <String, dynamic>{
      'age': instance.age,
      'reason': instance.reason,
      'studyTime': instance.studyTime,
      'lectures': instance.lectures,
      'privateLessons': instance.privateLessons,
      'postGraduate': instance.postGraduate,
      'roommate': instance.roommate,
      'distance': instance.distance,
      'hobbies': instance.hobbies,
      'semester': instance.semester,
    };

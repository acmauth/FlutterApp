// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) {
  return Teacher(
    id: json['_id'] as String,
    name: json['name'] as String,
    courses: (json['courses'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'courses': instance.courses,
    };

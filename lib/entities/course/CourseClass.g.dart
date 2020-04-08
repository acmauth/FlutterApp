// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CourseClass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseClass _$CourseClassFromJson(Map<String, dynamic> json) {
  return CourseClass(
    teachers: (json['teachers'] as List)?.map((e) => e as String)?.toList(),
    year: json['year'] as String,
  );
}

Map<String, dynamic> _$CourseClassToJson(CourseClass instance) =>
    <String, dynamic>{
      'teachers': instance.teachers,
      'year': instance.year,
    };

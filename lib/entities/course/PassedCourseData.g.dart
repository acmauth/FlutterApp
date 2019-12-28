// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PassedCourseData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PassedCourseData _$PassedCourseDataFromJson(Map<String, dynamic> json) {
  return PassedCourseData(
    baseData: json['baseData'] == null
        ? null
        : BaseCourseData.fromJson(json['baseData'] as Map<String, dynamic>),
    grade: (json['grade'] as num)?.toDouble(),
    year: json['year'] as String,
  );
}

Map<String, dynamic> _$PassedCourseDataToJson(PassedCourseData instance) =>
    <String, dynamic>{
      'baseData': instance.baseData?.toJson(),
      'grade': instance.grade,
      'year': instance.year,
    };

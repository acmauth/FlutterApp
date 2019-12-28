// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SuggestedCourseData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestedCourseData _$SuggestedCourseDataFromJson(Map<String, dynamic> json) {
  return SuggestedCourseData(
    baseData: json['baseData'] == null
        ? null
        : BaseCourseData.fromJson(json['baseData'] as Map<String, dynamic>),
    match: json['match'] as int,
    favTeacher: json['favTeacher'] as bool,
  );
}

Map<String, dynamic> _$SuggestedCourseDataToJson(
        SuggestedCourseData instance) =>
    <String, dynamic>{
      'baseData': instance.baseData?.toJson(),
      'match': instance.match,
      'favTeacher': instance.favTeacher,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QaCourseData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QaCourseData _$QaCourseDataFromJson(Map<String, dynamic> json) {
  return QaCourseData(
    base: json['base'] == null
        ? null
        : BaseCourseData.fromJson(json['base'] as Map<String, dynamic>),
    period: json['period'] as int,
    year: json['year'] as String,
    teachers: (json['teachers'] as List)?.map((e) => e as String)?.toList(),
    erasmus: json['erasmus'] as bool,
    goal: json['goal'] as String,
    content: (json['content'] as List)?.map((e) => e as String)?.toList(),
    assessDesc: json['assessDesc'] as String,
    assessMethods:
        (json['assessMethods'] as List)?.map((e) => e as String)?.toList(),
    preCourses: (json['preCourses'] as List)?.map((e) => e as String)?.toList(),
    preKnowledge:
        (json['preKnowledge'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$QaCourseDataToJson(QaCourseData instance) =>
    <String, dynamic>{
      'base': instance.base?.toJson(),
      'period': instance.period,
      'year': instance.year,
      'teachers': instance.teachers,
      'erasmus': instance.erasmus,
      'goal': instance.goal,
      'assessDesc': instance.assessDesc,
      'assessMethods': instance.assessMethods,
      'content': instance.content,
      'preCourses': instance.preCourses,
      'preKnowledge': instance.preKnowledge,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CourseMetrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseMetrics _$CourseMetricsFromJson(Map<String, dynamic> json) {
  return CourseMetrics(
    distribution: (json['distribution'] as List)
        ?.map((e) => (e as num)?.toDouble())
        ?.toList(),
    average: (json['average'] as num)?.toDouble(),
    enrolled: json['enrolled'] as int,
    histogram: (json['histogram'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$CourseMetricsToJson(CourseMetrics instance) =>
    <String, dynamic>{
      'distribution': instance.distribution,
      'average': instance.average,
      'enrolled': instance.enrolled,
      'histogram': instance.histogram,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CourseMetrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseMetrics _$CourseMetricsFromJson(Map<String, dynamic> json) {
  return CourseMetrics(
    difficulty:
        _$enumDecodeNullable(_$CourseDifficultyEnumMap, json['difficulty']),
    average: (json['average'] as num)?.toDouble(),
    enrolled: json['enrolled'] as int,
    histogram: (json['histogram'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$CourseMetricsToJson(CourseMetrics instance) =>
    <String, dynamic>{
      'average': instance.average,
      'enrolled': instance.enrolled,
      'difficulty': _$CourseDifficultyEnumMap[instance.difficulty],
      'histogram': instance.histogram,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$CourseDifficultyEnumMap = {
  CourseDifficulty.EASY: 'EASY',
  CourseDifficulty.MEDIUM: 'MEDIUM',
  CourseDifficulty.HARD: 'HARD',
  CourseDifficulty.VERY_HARD: 'VERY HARD',
};

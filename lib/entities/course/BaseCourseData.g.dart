// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BaseCourseData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseCourseData _$BaseCourseDataFromJson(Map<String, dynamic> json) {
  return BaseCourseData(
    title: json['title'] as String,
    code: json['code'] as String,
    teacher: json['teacher'] as String,
    averageGrade: (json['averageGrade'] as num)?.toDouble(),
    difficulty:
        _$enumDecodeNullable(_$CourseDifficultyEnumMap, json['difficulty']),
  );
}

Map<String, dynamic> _$BaseCourseDataToJson(BaseCourseData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'code': instance.code,
      'teacher': instance.teacher,
      'averageGrade': instance.averageGrade,
      'difficulty': _$CourseDifficultyEnumMap[instance.difficulty],
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
};

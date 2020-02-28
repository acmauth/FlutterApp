// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PredictedCourse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PredictedCourse _$PredictedCourseFromJson(Map<String, dynamic> json) {
  return PredictedCourse(
    courseCode: json['courseCode'] as String,
    courseName: json['courseName'] as String,
    courseTeacher: json['courseTeacher'] as String,
    gradePrediction: (json['gradePrediction'] as num)?.toDouble(),
    difficulty:
        _$enumDecodeNullable(_$CourseDifficultyEnumMap, json['difficulty']),
    gradePercentage: (json['gradePercentage'] as num)?.toDouble(),
    enrolledStudents: json['enrolledStudents'] as int,
    box1: (json['box1'] as num)?.toDouble(),
    box2: (json['box2'] as num)?.toDouble(),
    box3: (json['box3'] as num)?.toDouble(),
    box4: (json['box4'] as num)?.toDouble(),
    box5: (json['box5'] as num)?.toDouble(),
    box6: (json['box6'] as num)?.toDouble(),
    box7: (json['box7'] as num)?.toDouble(),
    box8: (json['box8'] as num)?.toDouble(),
    box9: (json['box9'] as num)?.toDouble(),
    box10: (json['box10'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$PredictedCourseToJson(PredictedCourse instance) =>
    <String, dynamic>{
      'courseCode': instance.courseCode,
      'courseName': instance.courseName,
      'courseTeacher': instance.courseTeacher,
      'gradePrediction': instance.gradePrediction,
      'difficulty': _$CourseDifficultyEnumMap[instance.difficulty],
      'gradePercentage': instance.gradePercentage,
      'enrolledStudents': instance.enrolledStudents,
      'box1': instance.box1,
      'box2': instance.box2,
      'box3': instance.box3,
      'box4': instance.box4,
      'box5': instance.box5,
      'box6': instance.box6,
      'box7': instance.box7,
      'box8': instance.box8,
      'box9': instance.box9,
      'box10': instance.box10,
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SemesterData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SemesterData _$SemesterDataFromJson(Map<String, dynamic> json) {
  return SemesterData(
    id: json['id'] as int,
    courseDataList: (json['courseDataList'] as List)
        ?.map((e) => e == null
            ? null
            : PassedCourseData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SemesterDataToJson(SemesterData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseDataList':
          instance.courseDataList?.map((e) => e?.toJson())?.toList(),
    };

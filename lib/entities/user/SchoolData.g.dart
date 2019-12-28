// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SchoolData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolData _$SchoolDataFromJson(Map<String, dynamic> json) {
  return SchoolData(
    department: json['department'] as String,
    semester: json['semester'] as int,
  );
}

Map<String, dynamic> _$SchoolDataToJson(SchoolData instance) =>
    <String, dynamic>{
      'department': instance.department,
      'semester': instance.semester,
    };

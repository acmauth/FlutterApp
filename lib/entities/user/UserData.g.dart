// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return UserData(
    userCreds: json['userCreds'] == null
        ? null
        : UserCredentials.fromJson(json['userCreds'] as Map<String, dynamic>),
    name: json['name'] as String,
    estYear: json['estYear'] as int,
    schoolData: json['schoolData'] == null
        ? null
        : SchoolData.fromJson(json['schoolData'] as Map<String, dynamic>),
    favSubjects:
        (json['favSubjects'] as List)?.map((e) => e as String)?.toList(),
    favTeachers:
        (json['favTeachers'] as List)?.map((e) => e as String)?.toList(),
    semesterDataList: (json['semesterDataList'] as List)
        ?.map((e) =>
            e == null ? null : SemesterData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'name': instance.name,
      'userCreds': instance.userCreds?.toJson(),
      'estYear': instance.estYear,
      'schoolData': instance.schoolData?.toJson(),
      'favSubjects': instance.favSubjects,
      'favTeachers': instance.favTeachers,
      'semesterDataList':
          instance.semesterDataList?.map((e) => e?.toJson())?.toList(),
    };

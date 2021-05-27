import 'package:meta/meta.dart';


class SchoolData {
  const SchoolData({
    @required this.school,
  });

  final String school;

  factory SchoolData.fromJson(Map<String, dynamic> json) {
    return SchoolData(school: json['school'] as String);
  }

  Map<String, dynamic> toJson() => <String,dynamic>{
    'school': school
  };
}

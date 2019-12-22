import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'SchoolData.g.dart';

@JsonSerializable(explicitToJson: true)

class SchoolData {
  const SchoolData({
    @required this.department,
    @required this.semester,
  });

  final String department;
  final int semester;

  factory SchoolData.fromJson(Map<String, dynamic> json) =>
      _$SchoolDataFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolDataToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'SchoolData.g.dart';

@JsonSerializable(explicitToJson: true)
class SchoolData {
  const SchoolData({
    @required this.school,
  });

  final String school;

  factory SchoolData.fromJson(Map<String, dynamic> json) =>
      _$SchoolDataFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolDataToJson(this);
}

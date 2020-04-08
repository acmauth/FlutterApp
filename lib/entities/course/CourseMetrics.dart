import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'CourseMetrics.g.dart';

@JsonSerializable(explicitToJson: true)

class CourseMetrics {
  CourseMetrics(
      {@required this.distribution,
      @required this.average,
      @required this.enrolled,
      @required this.histogram});

  final List<double> distribution;
  final double average;
  final int enrolled;
  final List<int> histogram;


  factory CourseMetrics.fromJson(Map<String, dynamic> json) =>
      _$CourseMetricsFromJson(json);

  Map<String, dynamic> toJson() => _$CourseMetricsToJson(this);
}

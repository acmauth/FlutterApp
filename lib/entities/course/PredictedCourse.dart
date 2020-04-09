import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

@JsonSerializable(explicitToJson: true)
class PredictedCourse {
  const PredictedCourse({
    @required this.courseID,
    @required this.gradePrediction,
    @required this.distribution,
  });

  final String courseID;
  final double gradePrediction;
  final double distribution;

  factory PredictedCourse.fromJson(Map<String, dynamic> json) {
    return PredictedCourse(
        courseID: json['id'],
        gradePrediction: double.parse(json['gradePrediction'].toString()),
        distribution: double.parse(json['distribution'].toString()));
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': courseID,
        'gradePrediction': gradePrediction,
        'distribution': distribution
      };
}

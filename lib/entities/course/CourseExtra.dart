import 'package:meta/meta.dart';

class CourseExtra {
  CourseExtra({
    @required this.erasmus,
    @required this.goal,
    @required this.content,
    @required this.assessDesc,
    @required this.assessMethods,
    @required this.preCourses,
    @required this.preKnowledge,
  });

  final bool erasmus;
  final String goal;
  final List<String> content;
  final String assessDesc;
  final List<String> assessMethods;
  final List<String> preCourses;
  final List<String> preKnowledge;

  factory CourseExtra.fromJson(Map<String, dynamic> json) {
    return CourseExtra(
        erasmus: json['erasmus'],
        goal: json['goal'],
        content: (json['content'] as List)?.map((e) => e as String)?.toList(),
        assessDesc: json['assessment']['description'],
        assessMethods: (json['assessment']['methods'] as List)
            ?.map((e) => e as String)
            ?.toList(),
        preCourses: (json['prerequisites']['courses'] as List)
            ?.map((e) => e as String)
            ?.toList(),
        preKnowledge: (json['prerequisites']['knowledge'] as List)
            ?.map((e) => e as String)
            ?.toList());
  }
}

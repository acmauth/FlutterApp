import 'package:meta/meta.dart';

class Teacher {
  Teacher({@required this.id, @required this.name, @required this.courses});

  final String id;
  final String name;
  final List<String> courses;

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['_id'] as String,
      name: json['name'] as String,
      courses: (json['courses'] as List)?.map((e) => e as String)?.toList(),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'courses': courses,
      };
}

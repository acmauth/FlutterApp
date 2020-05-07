

class FormData {
  FormData({
    this.name,
    this.school,
    this.semester,
    this.reason,
    this.studyTime,
    this.lectures,
    this.privateLessons,
    this.postgraduate,
    this.roomates,
    this.distance,
    this.hobbies,
  });

  String name;
  String school;
  int semester;
  String reason;
  int studyTime;
  String lectures;
  bool privateLessons;
  String postgraduate;
  String roomates;
  String distance;
  List<String> hobbies;

  factory FormData.fromJson(Map<String, dynamic> json) {
    return FormData(
      name: json['name'] as String,
      school: json['school'] as String,
      semester: json['semester'] as int,
      reason: json['reason'] as String,
      studyTime: json['study_time'] as int,
      lectures: json['lectures'] as String,
      privateLessons: json['privateLessons'] as bool,
      postgraduate: json['postgraduate'] as String,
      roomates: json['roomates'] as String,
      distance: json['distance'] as String,
      hobbies: (json['hobbies'] as List)?.map((e) => e as String)?.toList(),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'name': name,
    'school': school,
    'semester': semester,
    'reason': reason,
    'study_time': studyTime,
    'lectures': lectures,
    'privateLessons': privateLessons.toString(),
    'postgraduate': postgraduate,
    'roomates': roomates,
    'distance': distance,
    'hobbies': hobbies,
  };
}

import 'package:meta/meta.dart';

import 'SchoolData.dart';
import 'SemesterData.dart';

class UserData {
  const UserData({
    @required this.name,
    @required this.estYear,
    @required this.schoolData,
    @required this.favSubjects,
    @required this.favTeachers,
    @required this.semesterDataList,
  });

  final String name;
  final int estYear;
  final SchoolData schoolData;
  final List<String> favSubjects;
  final List<String> favTeachers;
  final List<SemesterData> semesterDataList;
}

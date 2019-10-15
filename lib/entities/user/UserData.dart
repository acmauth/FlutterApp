import 'package:meta/meta.dart';

import 'SchoolData.dart';
import 'SemesterData.dart';
import 'UserCredentials.dart';

class UserData {
  UserData({

    this.userCreds,
    this.name,
    @required this.estYear,
    @required this.schoolData,
    @required this.favSubjects,
    @required this.favTeachers,
    @required this.semesterDataList,
  });

  String name;
  UserCredentials userCreds;
  final int estYear;
  final SchoolData schoolData;
  final List<String> favSubjects;
  final List<String> favTeachers;
  final List<SemesterData> semesterDataList;
}
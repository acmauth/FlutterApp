import 'package:meta/meta.dart';

@immutable
class NotifState {
  const NotifState({
    @required this.hasSemester,
    @required this.hasGrades,
  });

  final bool hasSemester;
  final bool hasGrades;

  bool getHasSemester() {
    return hasSemester;
  }

  bool getHasGrades() {
    return hasGrades;
  }

  NotifState.fromJson(Map<String, dynamic> json)
      : hasSemester = json['hasSemester'],
        hasGrades = json['hasGrades'];

  Map<String, dynamic> toJson() => {
        'hasSemester': hasSemester,
        'hasGrades': hasGrades,
      };
}

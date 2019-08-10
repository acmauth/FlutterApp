import 'package:meta/meta.dart';

@immutable
abstract class NotifState {
  const NotifState({
    @required this.hasSemester,
    @required this.hasGrades,
  });

  final bool hasSemester;
  final bool hasGrades;
}

class NoSubs extends NotifState {
  const NoSubs() : super(hasSemester: false, hasGrades: false);
}

class SubbedToSemester extends NotifState {
  const SubbedToSemester() : super(hasSemester: true, hasGrades: false);
}

class SubbedToGrades extends NotifState {
  const SubbedToGrades() : super(hasSemester: false, hasGrades: true);
}

class SubbedToBoth extends NotifState {
  const SubbedToBoth() : super(hasSemester: true, hasGrades: true);
}

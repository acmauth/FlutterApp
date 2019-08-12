import 'package:meta/meta.dart';

@immutable
class NotifState {
  const NotifState({
    @required this.hasSemester,
    @required this.hasGrades,
  });

  final bool hasSemester;
  final bool hasGrades;
}

import 'package:meta/meta.dart';

@immutable
abstract class NotifEvent {}

class SubToSemester extends NotifEvent {}

class UnsubFromSemester extends NotifEvent {}

class SubToGrades extends NotifEvent {}

class UnsubFromGrades extends NotifEvent {}

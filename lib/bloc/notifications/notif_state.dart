import 'package:meta/meta.dart';

@immutable
abstract class NotifState {}

class NoSubs extends NotifState {}

class SubbedToSemester extends NotifState {}

class SubbedToGrades extends NotifState {}

class SubbedToBoth extends NotifState {}

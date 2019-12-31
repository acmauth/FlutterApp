import 'package:meta/meta.dart';

@immutable
abstract class SearchEvent {
  SearchEvent(this.label);
  final String label;
}

class CourseTapEvent extends SearchEvent {
  CourseTapEvent(String label) : super(label);
}

class HistoryDeleteEvent extends SearchEvent {
  HistoryDeleteEvent(String label) : super(label);
}

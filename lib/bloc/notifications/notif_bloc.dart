import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grade_plus_plus/bloc/notifications/exports.dart';

class NotifBloc extends Bloc<NotifEvent, NotifState> {
  @override
  NotifState get initialState => NotifState(
        hasSemester: true,
        hasGrades: true,
      );

  @override
  Stream<NotifState> mapEventToState(NotifEvent event) async* {
    if (event is SubToGrades) {
      _subToGrades();
      yield NotifState(
        hasSemester: currentState.hasSemester,
        hasGrades: true,
      );
    } else if (event is UnsubFromGrades) {
      _unsubFromGrades();
      yield NotifState(
        hasSemester: currentState.hasSemester,
        hasGrades: false,
      );
    } else if (event is SubToSemester) {
      _subToSemester();
      yield NotifState(
        hasSemester: true,
        hasGrades: currentState.hasGrades,
      );
    } else if (event is UnsubFromSemester) {
      _unsubFromSemester();
      yield NotifState(
        hasSemester: false,
        hasGrades: currentState.hasGrades,
      );
    }
  }

  void _subToGrades() {}

  void _unsubFromGrades() {}

  void _subToSemester() {}

  void _unsubFromSemester() {}
}

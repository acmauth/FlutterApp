import 'dart:async';

import 'package:bloc/bloc.dart';

import 'exports.dart';

class NotifBloc extends Bloc<NotifEvent, NotifState> {
  final NotifState initialNotifState;

  NotifBloc(this.initialNotifState);

  @override
  NotifState get initialState => NotifState(
        hasSemester: initialNotifState.getHasSemester(),
        hasGrades: initialNotifState.getHasGrades(),
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

  // TODO(dinos): Implement notifications

  void _subToGrades() {}

  void _unsubFromGrades() {}

  void _subToSemester() {}

  void _unsubFromSemester() {}
}

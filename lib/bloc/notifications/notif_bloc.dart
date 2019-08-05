import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grade_plus_plus/bloc/notifications/exports.dart';

class NotifBloc extends Bloc<NotifEvent, NotifState> {
  @override
  NotifState get initialState => SubbedToBoth();

  @override
  Stream<NotifState> mapEventToState(NotifEvent event) async* {
    if (event is SubToGrades) {
      _subToGrades();
      yield currentState is SubbedToSemester
          ? SubbedToBoth()
          : SubbedToGrades();
    } else if (event is UnsubFromGrades) {
      _unsubFromGrades();
      yield currentState is SubbedToBoth ? SubbedToSemester() : NoSubs();
    } else if (event is SubToSemester) {
      _subToSemester();
      yield currentState is SubbedToGrades
          ? SubbedToBoth()
          : SubbedToSemester();
    } else {
      // event is UnsubFromSemester
      _unsubFromSemester();
      yield currentState is SubbedToBoth ? SubbedToGrades() : NoSubs();
    }
  }

  _subToGrades() async {}

  _unsubFromGrades() async {}

  _subToSemester() async {}

  _unsubFromSemester() async {}
}

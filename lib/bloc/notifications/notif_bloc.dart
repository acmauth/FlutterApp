import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grade_plus_plus/bloc/notifications/exports.dart';

class NotifBloc extends Bloc<NotifEvent, NotifState> {
  @override
  NotifState get initialState => const SubbedToBoth();

  @override
  Stream<NotifState> mapEventToState(NotifEvent event) async* {
    if (event is SubToGrades) {
      _subToGrades();
      yield currentState is SubbedToSemester
          ? const SubbedToBoth()
          : const SubbedToGrades();
    } else if (event is UnsubFromGrades) {
      _unsubFromGrades();
      yield currentState is SubbedToBoth
          ? const SubbedToSemester()
          : const NoSubs();
    } else if (event is SubToSemester) {
      _subToSemester();
      yield currentState is SubbedToGrades
          ? const SubbedToBoth()
          : const SubbedToSemester();
    } else if (event is UnsubFromSemester) {
      _unsubFromSemester();
      yield currentState is SubbedToBoth
          ? const SubbedToGrades()
          : const NoSubs();
    }
  }

  void _subToGrades() {}

  void _unsubFromGrades() {}

  void _subToSemester() {}

  void _unsubFromSemester() {}
}

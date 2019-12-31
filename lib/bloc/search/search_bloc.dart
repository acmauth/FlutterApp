import 'dart:async';

import 'package:bloc/bloc.dart';

import './exports.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  @override
  SearchState get initialState => InitSearchState();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    var history = state.history;
    var label = event.label;
    if (event is CourseTapEvent) {
      history.remove(label);
      if (history.length >= 5) {
        history.removeLast();
      }
      history.add(label);
    } else if (event is HistoryDeleteEvent) {
      history.remove(label);
    }
    yield NuSearchState(history);
  }
}

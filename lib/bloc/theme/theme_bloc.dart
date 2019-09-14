import 'dart:async';

import 'package:bloc/bloc.dart';

import 'exports.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => LightTheme();

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    yield event is ToggleLight ? LightTheme() : DarkTheme();
  }
}

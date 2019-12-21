import 'dart:async';

import 'package:bloc/bloc.dart';

import 'exports.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeState initState;

  ThemeBloc(this.initState);

  @override
  ThemeState get initialState => this.initState;

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    yield event is ToggleLight ? LightTheme() : DarkTheme();
  }
}

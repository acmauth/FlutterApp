import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grade_plus_plus/bloc/theme/exports.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => LightTheme();

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    yield event is ToggleLight ? LightTheme() : DarkTheme();
  }
}

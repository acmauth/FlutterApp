import 'package:meta/meta.dart';

@immutable
abstract class ThemeEvent {}

class ToggleLight extends ThemeEvent {}

class ToggleDark extends ThemeEvent {}

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ThemeState {}

class LightTheme extends ThemeState {}

class DarkTheme extends ThemeState {}

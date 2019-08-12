import 'package:meta/meta.dart';

@immutable
abstract class AuthState {}

class NoAuth extends AuthState {}

class Verified extends AuthState {}

import 'package:meta/meta.dart';

@immutable
abstract class AuthEvent {}

class AuthSuccess extends AuthEvent {}

class LogOut extends AuthEvent {}

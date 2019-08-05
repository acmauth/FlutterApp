import 'package:meta/meta.dart';

@immutable
abstract class AuthEvent {}

class Success extends AuthEvent {}

class Fail extends AuthEvent {}

class SwitchToLogIn extends AuthEvent {}

class SwitchToSignUp extends AuthEvent {}

class UniLogIn extends AuthEvent {}

class UniSignUp extends AuthEvent {}

class LogOut extends AuthEvent {}

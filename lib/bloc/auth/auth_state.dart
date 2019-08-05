import 'package:meta/meta.dart';

@immutable
abstract class AuthState {}

class LogIn extends AuthState {}

class SignUp extends AuthState {}

class UniSSO extends AuthState {}

class Error extends AuthState {}

class Verified extends AuthState {}

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:grade_plus_plus/bloc/auth/exports.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => NoAuth();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    yield event is AuthSuccess ? Verified() : NoAuth();
  }
}

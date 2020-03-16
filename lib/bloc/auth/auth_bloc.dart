import 'dart:async';

import 'package:bloc/bloc.dart';

import 'exports.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final String token;
  final String refresh;

  AuthBloc(this.token, this.refresh);

  @override
  AuthState get initialState {
    if (this.token != null && this.refresh != null) {
      return Verified();
    }
    return NoAuth();
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    yield event is AuthSuccess ? Verified() : NoAuth();
  }
}

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:grade_plus_plus/bloc/auth/exports.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => LogIn();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is Fail) {
      yield Error();
    } else if (event is SwitchToLogIn || event is LogOut) {
      yield LogIn();
    } else if (event is SwitchToSignUp) {
      yield SignUp();
    } else if (event is UniLogIn || event is UniSignUp) {
      yield UniSSO();
    } else {
      // event is Success
      yield Verified();
    }
  }
}

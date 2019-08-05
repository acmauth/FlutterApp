import 'package:flutter/material.dart';
import 'package:grade_plus_plus/bloc/auth/exports.dart';
import 'package:grade_plus_plus/pages/authentication/AuthPage.dart';

class SignupScreen extends AuthPage {
  SignupScreen({Key key})
      : super(
          key: key,
          color: Colors.amber,
          verify: (email, pwd) {
            return true; // TODO
          },
          action: "Sign Up",
          altMessage: "Already have an account? Log In!",
          switchEvent: SwitchToLogIn(),
          uniEvent: UniSignUp(),
        );
}

import 'package:flutter/material.dart';
import 'package:grade_plus_plus/bloc/auth/exports.dart';
import 'package:grade_plus_plus/pages/authentication/AuthPage.dart';

class LoginScreen extends AuthPage {
  LoginScreen({Key key})
      : super(
          key: key,
          color: Colors.lightGreen,
          verify: (email, pwd) {
            return true; // TODO
          },
          action: "Log In",
          altMessage: "Don't have an account? Sign Up!",
          switchEvent: SwitchToSignUp(),
          uniEvent: UniLogIn(),
        );
}

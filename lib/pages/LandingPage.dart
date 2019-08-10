import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_plus_plus/bloc/auth/exports.dart';
import 'package:grade_plus_plus/pages/exports.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState authState) {
        return authState is Verified ? const HomeScreen() : const AuthPage();
      },
    );
  }
}

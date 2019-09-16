import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth/exports.dart';
import 'HomeScreen.dart';
import 'authentication/AuthPage.dart';

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

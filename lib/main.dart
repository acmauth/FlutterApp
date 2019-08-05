import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_plus_plus/bloc/auth/exports.dart';
import 'package:grade_plus_plus/bloc/notifications/exports.dart';
import 'package:grade_plus_plus/bloc/theme/exports.dart';
import 'package:grade_plus_plus/pages/exports.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    accentColor: Colors.lightBlue,
    brightness: Brightness.light,
  );
  final darkTheme = ThemeData(
    primarySwatch: Colors.red,
    accentColor: Colors.lightBlue,
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          builder: (context) => ThemeBloc(),
        ),
        BlocProvider<NotifBloc>(
          builder: (context) => NotifBloc(),
        ),
        BlocProvider<AuthBloc>(
          builder: (context) => AuthBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeSate) {
          return MaterialApp(
            title: 'Grade++',
            theme: themeSate is LightTheme ? lightTheme : darkTheme,
            home: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, authState) {
                if (authState is Verified) {
                  return HomeScreen();
                }
                if (authState is LogIn) {
                  return LoginScreen();
                }
                if (authState is SignUp) {
                  return SignupScreen();
                }
                if (authState is UniSSO) {
                  return HomeScreen(); // TODO
                }
                // authState is Error
                return null; // TODO
              },
            ),
          );
        },
      ),
    );
  }
}

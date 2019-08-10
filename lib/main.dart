import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_plus_plus/Router.dart';
import 'package:grade_plus_plus/bloc/auth/exports.dart';
import 'package:grade_plus_plus/bloc/notifications/exports.dart';
import 'package:grade_plus_plus/bloc/theme/exports.dart';
import 'package:grade_plus_plus/pages/exports.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    accentColor: Colors.lightBlue,
    cursorColor: Colors.lightBlue,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  );
  final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.red,
    accentColor: Colors.lightBlue,
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          builder: (BuildContext context) => ThemeBloc(),
        ),
        BlocProvider<NotifBloc>(
          builder: (BuildContext context) => NotifBloc(),
        ),
        BlocProvider<AuthBloc>(
          builder: (BuildContext context) => AuthBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState themeSate) {
          return MaterialApp(
            title: 'Grade++',
            theme: themeSate is LightTheme ? lightTheme : darkTheme,
            onGenerateRoute: Router.generateRoute,
            home: const LandingPage(),
          );
        },
      ),
    );
  }
}

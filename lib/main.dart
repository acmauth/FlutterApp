import 'package:bloc/bloc.dart';
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
    accentColor: Colors.lightBlue,
    backgroundColor: Colors.white,
    bottomAppBarColor: Colors.black45,
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
  );
  final ThemeData darkTheme = ThemeData(
    accentColor: Colors.lightBlue,
    brightness: Brightness.dark,
    bottomAppBarColor: Colors.white54,
    primarySwatch: Colors.red,
    textSelectionHandleColor: Colors.lightBlue,
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<Bloc<dynamic, dynamic>>>[
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
            builder: (BuildContext context, Widget child) {
              return ScrollConfiguration(
                behavior: Scroller(),
                child: child,
              );
            },
            home: const LandingPage(),
          );
        },
      ),
    );
  }
}

class Scroller extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

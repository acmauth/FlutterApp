import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'DataFetcher.dart';
import 'LocalKeyValuePersistence.dart';
import 'Router.dart';
import 'bloc/auth/exports.dart';
import 'bloc/notifications/exports.dart';
import 'bloc/search/search_bloc.dart';
import 'bloc/theme/exports.dart';
import 'pages/LandingPage.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Needed - Error since we call functions before initialize
  final ThemeState initialThemeState =
      await LocalKeyValuePersistence.getTheme(); // Getting the theme
  final NotifState initialNotifState = await LocalKeyValuePersistence
      .getNotifState(); // Getting the notification preferences
  String token = await LocalKeyValuePersistence.getUserToken();
  String refresh = await LocalKeyValuePersistence.getRefreshToken();
  DataFetcher.localAuth(token, refresh).then((succ) {
    if (!succ) {
      token = null;
      refresh = null;
    }
  });

  runApp(MyApp(
      initialThemeState: initialThemeState,
      initialNotifState: initialNotifState,
      token: token,
      refresh: refresh));
}

class MyApp extends StatefulWidget {
  final ThemeState initialThemeState;
  final NotifState initialNotifState;
  final String token;
  final String refresh;

  const MyApp(
      {Key key,
      this.initialThemeState,
      this.initialNotifState,
      this.token,
      this.refresh})
      : super(key: key);

  @override
  _MyAppState createState() =>
      _MyAppState(initialThemeState, initialNotifState, token, refresh);
}

class _MyAppState extends State<MyApp> {
  final ThemeState initialThemeState;
  final NotifState initialNotifState;
  final String token;
  final String refresh;
  final ThemeData lightTheme = ThemeData(
    accentColor: Colors.lightBlue,
    appBarTheme: AppBarTheme(
      color: Colors.white.withOpacity(0.95),
      elevation: 0.15,
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
    backgroundColor: Colors.white,
    bottomAppBarColor: Colors.lightBlue.shade600,
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
  );
  final ThemeData darkTheme = ThemeData(
    accentColor: Colors.lightBlue,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0.15,
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
    bottomAppBarColor: Colors.black,
    brightness: Brightness.dark,
    primarySwatch: Colors.red,
    textSelectionHandleColor: Colors.lightBlue,
  );

  _MyAppState(
      this.initialThemeState, this.initialNotifState, this.token, this.refresh);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<Bloc<dynamic, dynamic>>>[
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(initialThemeState),
        ),
        BlocProvider<NotifBloc>(
          create: (BuildContext context) => NotifBloc(initialNotifState),
        ),
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(token, refresh),
        ),
        BlocProvider<SearchBloc>(
          create: (BuildContext context) => SearchBloc(),
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
            home: LandingPage(),
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

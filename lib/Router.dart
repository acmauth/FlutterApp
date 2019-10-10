
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/LandingPage.dart';
import 'pages/UnknownPage.dart';
import 'pages/authentication/AuthPage.dart';
import 'pages/authentication/SsoScreen.dart';
import 'pages/search/CoursePage.dart';


class Router {
  static Route<PageRoute<Object>> generateRoute(
      RouteSettings settings,
      ) {
    final Object args = settings.arguments;
    switch (settings.name) {
      case '/':
      case '/home':
        return CupertinoPageRoute<CupertinoPageRoute<void>>(
          builder: (_) => LandingPage(),
        );
      case '/login':
        return CupertinoPageRoute<CupertinoPageRoute<void>>(
          builder: (_) => AuthPage(isLogIn: true),
        );
      case '/signup':
        return CupertinoPageRoute<CupertinoPageRoute<void>>(
          builder: (_) => AuthPage(isLogIn: false),
        );
      case '/sso':
        return CupertinoPageRoute<CupertinoPageRoute<void>>(
          builder: (_) => SsoScreen(),
        );
      case '/CoursePage':
        return CupertinoPageRoute<CupertinoPageRoute<void>>(
          builder: (_) => CoursePage(),
        );

    }
    return CupertinoPageRoute<CupertinoPageRoute<void>>(
      builder: (_) => UnknownPage(),
    );
  }

  static void push(BuildContext context, String route, {Object args}) {
    Navigator.of(context).pushNamed(route, arguments: args);
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void replace(BuildContext context, String route, {Object args}) {
    Navigator.of(context).pushReplacementNamed(route, arguments: args);
  }
}

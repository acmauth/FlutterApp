import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/exports.dart';

class Router {
  static Route<PageRoute<Object>> generateRoute(
    RouteSettings settings,
  ) {
    final Object args = settings.arguments;
    switch (settings.name) {
      case '/':
      case '/home':
        return CupertinoPageRoute<CupertinoPageRoute<void>>(
          builder: (_) => const LandingPage(),
        );
      case '/login':
        return CupertinoPageRoute<CupertinoPageRoute<void>>(
          builder: (_) => const AuthPage(isLogIn: true),
        );
      case '/signup':
        return CupertinoPageRoute<CupertinoPageRoute<void>>(
          builder: (_) => const AuthPage(isLogIn: false),
        );
      case '/sso':
        return CupertinoPageRoute<CupertinoPageRoute<void>>(
          builder: (_) => const SsoScreen(),
        );
    }
    return CupertinoPageRoute<CupertinoPageRoute<void>>(
      builder: (_) => const UnknownPage(),
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

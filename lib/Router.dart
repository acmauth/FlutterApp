import 'package:flutter/cupertino.dart';

import 'pages/LandingPage.dart';
import 'pages/UnknownPage.dart';
import 'pages/authentication/AuthPage.dart';
import 'pages/authentication/SsoScreen.dart';
import 'pages/authentication/forms/MiscForm.dart';
import 'pages/authentication/forms/PersonalForm.dart';
import 'pages/authentication/forms/UniForm.dart';
import 'pages/search/CoursePage.dart';
import 'pages/settings/ChangePassword.dart';
import 'pages/settings/UploadGrades.dart';
import 'pages/user_profile/EditProfile.dart';

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
      case '/form/personal':
        return CupertinoPageRoute<CupertinoPageRoute<void>>(
          builder: (_) => PersonalForm(),
        );
      case '/form/uni':
        return CupertinoPageRoute<CupertinoPageRoute<void>>(
          builder: (_) => UniForm(formData: args),
        );
      case '/form/misc':
        return CupertinoPageRoute<CupertinoPageRoute<void>>(
          builder: (_) => MiscForm(formData: args),
        );
      case '/course':
        return CupertinoPageRoute<CupertinoPageRoute<void>>(
          builder: (_) => CoursePage(course: args),
        );
      case '/change_password':
        return CupertinoPageRoute<CupertinoPageRoute<void>>(
          builder: (_) => ChangePassword(),
        );
      case '/edit_profile':
        Map<String, dynamic> map = args;
        return CupertinoPageRoute<CupertinoPageRoute<void>>(
          builder: (_) => EditProfile(
              data: map['data'],
              courses: map['courses'],
              teachers: map['teachers']),
        );
      case '/update_grades':
        return CupertinoPageRoute<CupertinoPageRoute<void>>(
          builder: (_) => UploadGrades(),
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

  static void replaceAll(BuildContext context, String route, {Object args}) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        route, (Route<dynamic> route) => false,
        arguments: args);
  }

  static void replace(BuildContext context, String route, {Object args}) {
    Navigator.of(context).pushReplacementNamed(route, arguments: args);
  }
}

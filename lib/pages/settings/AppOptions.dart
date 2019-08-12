import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_plus_plus/bloc/auth/auth_bloc.dart';
import 'package:grade_plus_plus/bloc/auth/exports.dart';
import 'package:grade_plus_plus/bloc/notifications/exports.dart';
import 'package:grade_plus_plus/bloc/theme/exports.dart';
import 'package:grade_plus_plus/pages/fragments/exports.dart';
import 'package:url_launcher/url_launcher.dart';

class AppOptions extends StatelessWidget {
  const AppOptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeBloc themeBloc = BlocProvider.of<ThemeBloc>(context);
    final NotifBloc notifBloc = BlocProvider.of<NotifBloc>(context);

    return Column(
      children: <Widget>[
        SectionHeader(
          title: 'App Options',
          icon: Icons.settings_applications,
        ),
        BlocBuilder<ThemeBloc, ThemeState>(
          bloc: themeBloc,
          builder: (BuildContext context, ThemeState themeState) {
            return ToggleableElement(
              name: 'Dark Mode',
              icon: Icons.phone_android,
              toggle: (bool toggleDark) => themeBloc.dispatch(
                toggleDark ? ToggleDark() : ToggleLight(),
              ),
              isOn: themeState is DarkTheme,
            );
          },
        ),
        BlocBuilder<NotifBloc, NotifState>(
          bloc: notifBloc,
          builder: (BuildContext context, NotifState notifState) {
            return ExpandableElement(
              name: 'Notifications',
              icon: Icons.alarm,
              column: Column(
                children: <Widget>[
                  CheckableElement(
                    name: 'New Semester',
                    icon: Icons.calendar_today,
                    toggle: (bool semesterOn) => notifBloc.dispatch(
                      semesterOn ? SubToSemester() : UnsubFromSemester(),
                    ),
                    isOn: notifState.hasSemester,
                  ),
                  CheckableElement(
                    name: 'Missing Grades',
                    icon: Icons.warning,
                    toggle: (bool gradesOn) => notifBloc
                        .dispatch(gradesOn ? SubToGrades() : UnsubFromGrades()),
                    isOn: notifState.hasGrades,
                  ),
                ],
              ),
            );
          },
        ),
        TappableElement(
          label:
              'Rate us on ${Platform.isAndroid ? 'Google Play Store' : 'App Store'}',
          icon: Icons.thumb_up,
          onTap: () async => await launch(
            Platform.isAndroid ? 'https://google.com' : 'https://apple.com',
          ),
        ),
        TappableElement(
          label: 'Log Out',
          icon: Icons.exit_to_app,
          color: Colors.red.shade500,
          onTap: () => BlocProvider.of<AuthBloc>(context).dispatch(LogOut()),
        ),
      ],
    );
  }
}

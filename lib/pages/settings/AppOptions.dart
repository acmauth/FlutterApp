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
  AppOptions({Key key}) : super(key: key);

  final platform = Platform.isAndroid ? "Google Play Store" : "App Store";
  final storeUrl =
      Platform.isAndroid ? "https://google.com" : "https://apple.com";

  @override
  Widget build(BuildContext context) {
    ThemeBloc themeBloc = BlocProvider.of<ThemeBloc>(context);
    NotifBloc notifBloc = BlocProvider.of<NotifBloc>(context);

    return Column(
      children: <Widget>[
        SectionHeader(
          title: "App Options",
          icon: Icons.settings_applications,
        ),
        BlocBuilder<ThemeBloc, ThemeState>(
          bloc: themeBloc,
          builder: (context, themeState) {
            return ToggleableElement(
              name: "Dark Mode",
              icon: Icons.phone_android,
              toggle: (toggleDark) =>
                  themeBloc.dispatch(toggleDark ? ToggleDark() : ToggleLight()),
              isOn: themeState is DarkTheme,
            );
          },
        ),
        BlocBuilder<NotifBloc, NotifState>(
          bloc: notifBloc,
          builder: (context, notifState) {
            return ExpandableElement(
              name: "Notifications",
              icon: Icons.alarm,
              column: Column(
                children: <Widget>[
                  CheckableElement(
                    name: "New Semester",
                    icon: Icons.calendar_today,
                    toggle: (semesterOn) => notifBloc.dispatch(
                        semesterOn ? SubToSemester() : UnsubFromSemester()),
                    isOn: notifState is SubbedToSemester ||
                        notifState is SubbedToBoth,
                  ),
                  CheckableElement(
                    name: "Missing Grades",
                    icon: Icons.warning,
                    toggle: (gradesOn) => notifBloc
                        .dispatch(gradesOn ? SubToGrades() : UnsubFromGrades()),
                    isOn: notifState is SubbedToGrades ||
                        notifState is SubbedToBoth,
                  ),
                ],
              ),
            );
          },
        ),
        TappableElement(
          label: "Rate us on $platform",
          icon: Icons.thumb_up,
          onTap: () async {
            await launch(storeUrl);
          },
        ),
        TappableElement(
          label: "Log Out",
          icon: Icons.exit_to_app,
          color: Colors.red.shade500,
          onTap: () async {
            BlocProvider.of<AuthBloc>(context).dispatch(LogOut());
          },
        ),
      ],
    );
  }
}

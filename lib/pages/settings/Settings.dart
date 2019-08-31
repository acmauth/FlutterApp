import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_plus_plus/pages/AbstractPage.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:grade_plus_plus/bloc/auth/exports.dart';
import 'package:grade_plus_plus/bloc/notifications/exports.dart';
import 'package:grade_plus_plus/bloc/theme/exports.dart';
import 'package:grade_plus_plus/router.dart';
import 'package:grade_plus_plus/pages/fragments/exports.dart';

class SettingsPage extends AbstractPage {
  SettingsPage({Key key})
      : super(
          key: key,
          appBarTitle: 'Settings',
          content: StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Column(
                children: <Widget>[
                  _buildProfileInfo(context),
                  _buildAppOptions(context),
                ],
              );
            },
          ),
          navItem: BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: const Text('Settings'),
          ),
        );
}

Column _buildProfileInfo(BuildContext context) {
  return Column(
    children: <Widget>[
      SectionHeader(
        title: 'Profile Information',
        extras: Icon(Icons.person_outline),
      ),
      TappableElement(
        label: 'Edit Account',
        icon: Icons.person_pin_circle,
        onTap: () => Router.push(context, '/edit_account'),
      ),
      TappableElement(
        label: 'Update Grades',
        icon: Icons.loop,
        onTap: () => Router.push(context, '/update_grades'),
      ),
      TappableElement(
        label: 'Download Data',
        icon: Icons.file_download,
        onTap: () => Router.push(context, '/download_data'),
      ),
      TappableElement(
        label: 'Request Deletion',
        icon: Icons.delete,
        color: Colors.red.shade400,
        onTap: () => Router.push(context, '/request_deletion'),
      ),
    ],
  );
}

Column _buildAppOptions(BuildContext context) {
  final ThemeBloc themeBloc = BlocProvider.of<ThemeBloc>(context);
  final NotifBloc notifBloc = BlocProvider.of<NotifBloc>(context);

  return Column(
    children: <Widget>[
      SectionHeader(
        title: 'App Options',
        extras: Icon(Icons.settings_applications),
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

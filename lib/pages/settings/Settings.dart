import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/AbstractPage.dart';
import 'package:grade_plus_plus/pages/settings/AppOptions.dart';
import 'package:grade_plus_plus/pages/settings/ProfileInfo.dart';

class SettingsPage extends AbstractPage {
  SettingsPage({Key key})
      : super(
          key: key,
          appBarTitle: 'Settings',
          content: Column(
            children: const <Widget>[
              ProfileInfo(),
              AppOptions(),
            ],
          ),
          navItem: BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: const Text('Settings'),
          ),
        );
}

import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/AbstractPage.dart';
import 'package:grade_plus_plus/pages/settings/AppOptions.dart';
import 'package:grade_plus_plus/pages/settings/ProfileInfo.dart';

class SettingsPage extends AbstractPage {
  SettingsPage({Key key})
      : super(
          key: key,
          appBarTitle: "Settings",
          content: Column(
            children: <Widget>[
              ProfileInfo(),
              AppOptions(),
            ],
          ),
          navItem: BottomNavigationBarItem(
            icon: new Icon(Icons.settings),
            title: Text("Settings"),
          ),
        );
}

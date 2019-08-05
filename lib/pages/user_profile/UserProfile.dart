import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/AbstractPage.dart';

class UserProfile extends AbstractPage {
  UserProfile({Key key})
      : super(
          key: key,
          appBarTitle: "User Profile",
          content: RaisedButton(
            onPressed: () {},
            child: Text("todo"),
          ),
          navItem: BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: Text("Profile"),
          ),
        );
}

import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/AbstractPage.dart';

class Search extends AbstractPage {
  Search({Key key})
      : super(
          key: key,
          appBarTitle: "Search",
          content: RaisedButton(
            onPressed: () {},
            child: Text("todo"),
          ),
          navItem: BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            title: Text("Search"),
          ),
        );
}

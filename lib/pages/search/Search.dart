import 'package:flutter/material.dart';

import '../AbstractPage.dart';

class Search extends AbstractPage {
  Search({Key key})
      : super(
          key: key,
          appBarTitle: 'Search',
          navIcon: Icons.search,
        );

  _SearchState createState() => _SearchState();
}

class _SearchState extends PageState<Search> {
  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    return RaisedButton(
      onPressed: () {},
      child: Text("todo"),
    );
  }
}

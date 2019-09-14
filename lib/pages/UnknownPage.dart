import 'package:flutter/material.dart';

import 'AbstractPage.dart';

class UnknownPage extends AbstractPage {
  UnknownPage({Key key})
      : super(
          key: key,
          appBarTitle: 'Unknown',
          appBarColorBg: Colors.red,
          appBarColorTxt: Colors.white,
        );

  _UnknownPageState createState() => _UnknownPageState();
}

class _UnknownPageState extends PageState<UnknownPage> {
  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    return Center(/* TODO */);
  }
}

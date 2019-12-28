import 'package:flutter/material.dart';

import '../AbstractPage.dart';
import '../formScreens/screen1.dart';

class SsoScreen extends AbstractPage {
  SsoScreen({Key key})
      : super(
            key: key,
            appBarTitle: 'Single Sign-On',
            appBarColorBg: Colors.amber,
            appBarColorTxt: Colors.white);

  @override
  _SsoScreenState createState() => _SsoScreenState();
}

class _SsoScreenState extends PageState {
  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    return Center(
        child: RaisedButton(
      child: Text("Show Form"),
      onPressed: () {
        Navigator.push(
            context, new MaterialPageRoute(builder: (__) => new screen1()));
      },
    ));
  }
}

import 'package:flutter/material.dart';
import '../fragments/BlankPadding.dart';
import '../fragments/StyledText.dart';
import '../AbstractPage.dart';

class UnknownPage extends AbstractPage {
  UnknownPage({
    Key key,
    String appBarTitle,
    @required this.message
  }) : super(
          key: key,
          appBarTitle: appBarTitle,
          appBarColorBg: Colors.lightBlue,
          appBarColorTxt: Colors.white,
        );

  final String message;

  _UnknownPageState createState() => _UnknownPageState();
}

class _UnknownPageState extends PageState<UnknownPage> {
  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    return Container(
      padding: EdgeInsets.only(top: 100),
      child: Column(
        children: <Widget>[
          BlankPadding(),
          Image.asset(
            'assets/warning.png',
            height: 150,
            width: 150,
          ),
          BlankPadding(),
          StyledText(
            "Under Construction",
            size: 18,
          ),
          BlankPadding(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: StyledText(
                widget.message,
                size: 14,
                align: TextAlign.center
            ),
          ),
        ],
      ),
    );
  }
}

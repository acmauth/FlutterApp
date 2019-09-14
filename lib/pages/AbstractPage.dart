import 'package:flutter/material.dart';

abstract class AbstractPage extends StatefulWidget {
  const AbstractPage({
    Key key,
    @required this.appBarTitle,
    this.appBarColorBg,
    this.appBarColorTxt,
    this.navIcon,
    this.hideBackArrow = false,
  }) : super(key: key);

  final String appBarTitle;
  final Color appBarColorBg;
  final Color appBarColorTxt;
  final IconData navIcon;
  final bool hideBackArrow;

  PageState createState();
}

abstract class PageState<T extends AbstractPage> extends State<T> {
  @override
  Widget build(BuildContext context) {
    final AppBarTheme theme = Theme.of(context).appBarTheme;
    final Color appBarColorBg =
        widget.appBarColorBg == null ? theme.color : widget.appBarColorBg;
    final Color appBarColorTxt = widget.appBarColorTxt == null
        ? theme.textTheme.title.color
        : widget.appBarColorTxt;

    final GlobalKey<ScaffoldState> _scfKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scfKey,
      appBar: AppBar(
        title: Text(
          widget.appBarTitle,
          style: TextStyle(color: appBarColorTxt),
        ),
        backgroundColor: appBarColorBg,
        centerTitle: true,
        automaticallyImplyLeading: !widget.hideBackArrow,
      ),
      body: SingleChildScrollView(child: Center(child: body(_scfKey))),
    );
  }

  Widget body(GlobalKey<ScaffoldState> scfKey);
}

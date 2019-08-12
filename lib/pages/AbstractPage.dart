import 'package:flutter/material.dart';

abstract class AbstractPage extends StatefulWidget {
  const AbstractPage({
    Key key,
    @required this.appBarTitle,
    @required this.content,
    this.navItem,
  }) : super(key: key);

  final String appBarTitle;
  final Widget content;
  final BottomNavigationBarItem navItem;

  @override
  _AbstractPageState createState() => _AbstractPageState();
}

class _AbstractPageState extends State<AbstractPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.appBarTitle)),
      body: SingleChildScrollView(child: Center(child: widget.content)),
    );
  }
}

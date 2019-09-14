import 'package:flutter/material.dart';

import 'IconLabelPair.dart';

class CheckableElement extends StatefulWidget {
  const CheckableElement({
    Key key,
    @required this.name,
    @required this.icon,
    @required this.toggle,
    @required this.isOn,
  }) : super(key: key);

  final String name;
  final IconData icon;
  final dynamic toggle;
  final bool isOn;

  @override
  _CheckableElementState createState() => _CheckableElementState();
}

class _CheckableElementState extends State<CheckableElement> {
  @override
  Widget build(BuildContext context) {
    final Checkbox checkObj = Checkbox(
      activeColor: Theme.of(context).accentColor,
      value: widget.isOn,
      onChanged: widget.toggle,
    );

    return Container(
      child: FlatButton(
        onPressed: () => checkObj.onChanged(!widget.isOn),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconLabelPair(
              label: widget.name,
              icon: widget.icon,
            ),
            checkObj,
          ],
        ),
      ),
    );
  }
}

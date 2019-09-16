import 'package:flutter/material.dart';

import 'IconLabelPair.dart';

class ToggleableElement extends StatefulWidget {
  const ToggleableElement({
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
  _ToggleableElementState createState() => _ToggleableElementState();
}

class _ToggleableElementState extends State<ToggleableElement> {
  @override
  Widget build(BuildContext context) {
    final Switch switchObj = Switch.adaptive(
      activeColor: Theme.of(context).accentColor,
      value: widget.isOn,
      onChanged: widget.toggle,
    );

    return FlatButton(
      onPressed: () => switchObj.onChanged(!widget.isOn),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconLabelPair(
            label: widget.name,
            icon: widget.icon,
          ),
          switchObj,
        ],
      ),
    );
  }
}

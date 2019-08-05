import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/fragments/IconLabelPair.dart';

class ToggleableElement extends StatefulWidget {
  ToggleableElement({
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

  _ToggleableElementState createState() => _ToggleableElementState();
}

class _ToggleableElementState extends State<ToggleableElement> {
  @override
  Widget build(BuildContext context) {
    var switchObj = Switch.adaptive(
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

import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/fragments/IconLabelPair.dart';

class ExpandableElement extends StatefulWidget {
  ExpandableElement({
    Key key,
    @required this.name,
    @required this.icon,
    @required this.column,
  }) : super(key: key);

  final String name;
  final IconData icon;
  final Column column;

  _ExpandableElementState createState() => _ExpandableElementState();
}

class _ExpandableElementState extends State<ExpandableElement> {
  IconData arrow;
  bool expanded = false;

  _setArrow() {
    arrow = expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down;
  }

  @override
  Widget build(BuildContext context) {
    _setArrow();

    return Column(
      children: <Widget>[
        FlatButton(
          onPressed: () {
            setState(() {
              expanded = !expanded;
              _setArrow();
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconLabelPair(
                icon: widget.icon,
                label: widget.name,
              ),
              Row(
                children: <Widget>[
                  Icon(arrow),
                  Padding(padding: EdgeInsets.all(10)),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: expanded ? widget.column : null,
        ),
      ],
    );
  }
}

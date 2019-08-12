import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/fragments/exports.dart';

class ExpandableElement extends StatefulWidget {
  const ExpandableElement({
    Key key,
    @required this.name,
    @required this.icon,
    @required this.column,
  }) : super(key: key);

  final String name;
  final IconData icon;
  final Column column;

  @override
  _ExpandableElementState createState() => _ExpandableElementState();
}

class _ExpandableElementState extends State<ExpandableElement> {
  IconData arrow = Icons.arrow_drop_down;
  bool expanded = false;

  void _toggleExpand() {
    setState(() {
      expanded = !expanded;
      arrow = expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          onPressed: _toggleExpand,
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
                  const BlankPadding(),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: expanded ? widget.column : null,
        ),
      ],
    );
  }
}

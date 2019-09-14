import 'package:flutter/material.dart';

import 'SectionHeader.dart';

class ExpandableSection extends StatefulWidget {
  const ExpandableSection({
    Key key,
    @required this.title,
    this.subtitle,
    this.barColor,
    @required this.content,
    this.fillContentBg = true,
    this.padding = const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
    this.extras = const Center(),
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Color barColor;
  final Widget content;
  final bool fillContentBg;
  final EdgeInsets padding;
  final Widget extras;

  @override
  _ExpandableSectionState createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool expanded = true;

  void _toggleExpand() {
    setState(() {
      expanded = !expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: _toggleExpand,
          child: SectionHeader(
            title: widget.title,
            subtitle: widget.subtitle,
            barColor: widget.barColor,
            extras: widget.extras,
          ),
        ),
        if (expanded)
          Container(
            child: widget.content,
            padding: widget.padding,
            color: widget.fillContentBg ? Colors.grey.withOpacity(0.05) : null,
          ),
      ],
    );
  }
}

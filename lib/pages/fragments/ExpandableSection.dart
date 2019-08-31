import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/fragments/exports.dart';

class ExpandableSection extends StatefulWidget {
  const ExpandableSection({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.content,
    this.extras,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Widget content;
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
            extras: widget.extras,
          ),
        ),
        Container(
          child: expanded
              ? Container(
                  child: widget.content,
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
                  color: Colors.grey.withOpacity(0.05),
                )
              : null,
        ),
      ],
    );
  }
}

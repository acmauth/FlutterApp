import 'package:flutter/material.dart';

import 'BlankPadding.dart';
import 'StyledText.dart';

class SectionHeader extends Row {
  SectionHeader({
    Key key,
    @required String title,
    Color barColor,
    Color textColor = Colors.blue,
    String subtitle,
    Widget extras = const BlankPadding(),
  }) : super(
          key: key,
          children: <Expanded>[
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                color: barColor == null
                    ? Colors.lightBlue.withOpacity(0.25)
                    : barColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildTitle(title, subtitle, textColor),
                    extras,
                  ],
                ),
              ),
            ),
          ],
        );
}

Widget _buildTitle(String title, String subtitle, Color color) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      StyledText(
        title,
        color: color,
        weight: FontWeight.bold,
      ),
      if (subtitle != null)
        StyledText(
          subtitle,
          color: Colors.lightBlue,
        ),
    ],
  );
}

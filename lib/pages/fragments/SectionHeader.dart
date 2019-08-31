import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/fragments/StyledText.dart';

class SectionHeader extends Row {
  SectionHeader({
    Key key,
    @required String title,
    Color color = Colors.blueAccent,
    String subtitle,
    Widget extras,
  }) : super(
          key: key,
          children: <Expanded>[
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                color: const Color.fromARGB(25, 33, 150, 243),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildTitle(title, subtitle, color),
                    extras,
                  ],
                ),
              ),
            ),
          ],
        );
}

Widget _buildTitle(String title, String subtitle, Color color) {
  final titleText = StyledText(
    text: title,
    color: color,
    weight: FontWeight.bold,
  );
  return subtitle == null
      ? titleText
      : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            titleText,
            StyledText(
              text: subtitle,
              color: Colors.lightBlue.shade600.withOpacity(0.5),
            ),
          ],
        );
}

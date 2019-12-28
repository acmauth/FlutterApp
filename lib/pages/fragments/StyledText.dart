import 'package:flutter/material.dart';

class StyledText extends Text {
  StyledText(
    String text, {
    Key key,
    Color color = Colors.blue,
    FontWeight weight = FontWeight.normal,
    TextAlign align = TextAlign.start,
    double size = 14,
  }) : super(
          text,
          key: key,
          textAlign: align,
          style: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: weight,
          ),
        );
}

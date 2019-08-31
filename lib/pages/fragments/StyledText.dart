import 'package:flutter/material.dart';

class StyledText extends Text {
  StyledText({
    Key key,
    @required String text,
    Color color = Colors.blueAccent,
    FontWeight weight = FontWeight.normal,
    double size = 14,
  }) : super(
          text,
          key: key,
          style: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: weight,
          ),
        );
}

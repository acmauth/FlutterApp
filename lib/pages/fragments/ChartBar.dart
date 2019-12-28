import 'package:flutter/material.dart';

class ChartBar extends Expanded {
  ChartBar({
    Key key,
    @required double height,
  }) : super(
          key: key,
          flex: 1,
          child: Container(
            height: height,
            width: 10,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment(0.0, 1),
                colors: [
                  Colors.blue,
                  Colors.lightBlue[50],
                ], // whitish to gray
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),
          ),
        );
}

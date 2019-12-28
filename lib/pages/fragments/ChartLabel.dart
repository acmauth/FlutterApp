import 'package:flutter/material.dart';

import 'StyledText.dart';

class ChartLabel extends Expanded {
  ChartLabel(String text)
      : super(
          flex: 1,
          child: Container(
            width: 10,
            child: StyledText(
              text,
              align: TextAlign.center,
            ),
          ),
        );
}

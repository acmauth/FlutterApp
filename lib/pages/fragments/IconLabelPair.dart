import 'package:flutter/material.dart';

import 'BlankPadding.dart';
import 'StyledText.dart';

class IconLabelPair extends Row {
  IconLabelPair({
    Key key,
    @required String label,
    @required IconData icon,
    Color color,
  }) : super(
          key: key,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Row(
                children: <Widget>[
                  Icon(icon),
                  const BlankPadding(),
                  StyledText(
                    label,
                    color: color == null ? Colors.lightBlueAccent : color,
                  ),
                ],
              ),
            ),
          ],
        );
}

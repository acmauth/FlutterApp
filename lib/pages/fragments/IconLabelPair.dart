import 'package:flutter/material.dart';

import 'BlankPadding.dart';
import 'StyledText.dart';

class IconLabelPair extends Padding {
  IconLabelPair({
    Key key,
    @required String label,
    @required IconData icon,
    Color color: Colors.lightBlueAccent,
    bool flexi: false,
  }) : super(
          key: key,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Row(
            children: <Widget>[
              Icon(icon),
              const BlankPadding(),
              flexi
                  ? Flexible(
                      child: StyledText(
                        label,
                        color: color,
                      ),
                    )
                  : StyledText(
                      label,
                      color: color,
                    ),
            ],
          ),
        );
}

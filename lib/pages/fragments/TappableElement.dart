import 'package:flutter/material.dart';

import 'IconLabelPair.dart';

class TappableElement extends FlatButton {
  TappableElement({
    Key key,
    @required String label,
    @required IconData icon,
    Color color,
    @required dynamic onTap,
  }) : super(
          key: key,
          onPressed: onTap,
          child: IconLabelPair(
            label: label,
            icon: icon,
            color: color,
          ),
        );
}

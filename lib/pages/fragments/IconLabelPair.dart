import 'package:flutter/material.dart';

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
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Row(
                children: <Widget>[
                  Icon(icon),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color == null ? Colors.lightBlue.shade300 : color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
}

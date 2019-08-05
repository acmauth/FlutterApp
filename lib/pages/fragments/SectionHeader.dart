import 'package:flutter/material.dart';

class SectionHeader extends Row {
  SectionHeader({
    Key key,
    @required String title,
    @required IconData icon,
  }) : super(
          key: key,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                color: Color.fromARGB(90, 33, 150, 243),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(title),
                    Icon(icon),
                  ],
                ),
              ),
            ),
          ],
        );
}

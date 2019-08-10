import 'package:flutter/material.dart';

class SectionHeader extends Row {
  SectionHeader({
    Key key,
    @required String title,
    @required IconData icon,
  }) : super(
          key: key,
          children: <Expanded>[
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                color: const Color.fromARGB(90, 33, 150, 243),
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

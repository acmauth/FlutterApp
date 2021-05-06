import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/fragments/StyledText.dart';

// Represents the description of each step at Instructions Page
class InstructionsStepDescription extends StatelessWidget {
  final int imgIndex;
  final String description;

  InstructionsStepDescription({this.imgIndex, this.description});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Title widget
          StyledText(
            'Step ' + (imgIndex + 1).toString(),
            size: 30.0,
            weight: FontWeight.values[5],
          ),
          SizedBox(
            height: 10.0,
          ),
          // Description widget
          Padding(
            padding: const EdgeInsets.only(
              left: 35.0,
              right: 35.0,
            ),
            child: StyledText(
              description,
              align: TextAlign.center,
              size: 18.0,
              weight: FontWeight.values[4],
            ),
          )
        ],
      ),
    );
  }
}

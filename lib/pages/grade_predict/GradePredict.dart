import 'package:flutter/material.dart';

import '../AbstractPage.dart';

class GradePredict extends AbstractPage {
  GradePredict({Key key})
      : super(
          key: key,
          appBarTitle: 'Grade Prediction',
          navIcon: Icons.equalizer,
        );

  _GradePredictState createState() => _GradePredictState();
}

class _GradePredictState extends PageState<GradePredict> {
  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    return RaisedButton(
      onPressed: () {},
      child: Text("todo"),
    );
  }
}

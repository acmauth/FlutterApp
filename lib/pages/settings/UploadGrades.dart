import 'package:flutter/material.dart';

import '../../DataFetcher.dart';
import '../../Router.dart';
import '../AbstractPage.dart';
import '../fragments/BlankPadding.dart';
import '../fragments/FileSelector.dart';

class UploadGrades extends AbstractPage {
  UploadGrades({Key key})
      : super(
          key: key,
          appBarTitle: 'Upload Grades',
          appBarColorBg: Colors.lightBlue,
          appBarColorTxt: Colors.white,
        );

  _UploadGradesState createState() => _UploadGradesState();
}

class _UploadGradesState extends PageState<UploadGrades> {
  final selectorKey = GlobalKey<FileSelectorState>();

  @override
  Widget body(GlobalKey<ScaffoldState> scfState) {
    void _uploadGrades() async {
      scfState.currentState.hideCurrentSnackBar();
      if (selectorKey.currentState.path == null) {
        scfState.currentState.showSnackBar(
          _buildErrorSnack("You haven't selected a file!"),
        );
        return;
      }

      DataFetcher.uploadGrades(selectorKey.currentState.path).then((success) {
        if (success) {
          Router.pop(context);
        } else {
          scfState.currentState.showSnackBar(
            _buildErrorSnack("Something went wrong!"),
          );
        }
      });
    }

    FlatButton _buildUploadButton() {
      return FlatButton(
        color: Theme.of(context).accentColor,
        textColor: Colors.white,
        onPressed: () => _uploadGrades(),
        child: const Text('Upload Grades'),
      );
    }

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          FileSelector(key: selectorKey),
          BlankPadding(),
          _buildUploadButton(),
        ],
      ),
    );
  }

  SnackBar _buildErrorSnack(String text) {
    return SnackBar(
      content: Text(text),
      backgroundColor: Colors.redAccent,
    );
  }
}

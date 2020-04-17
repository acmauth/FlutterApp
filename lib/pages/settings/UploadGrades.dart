import 'package:flutter/material.dart';

import '../../DataFetcher.dart';
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
  GlobalKey<ScaffoldState> scKey = new GlobalKey<ScaffoldState>();

  final selectorKey = new GlobalKey<FileSelectorState>();

  @override
  Widget body(GlobalKey<ScaffoldState> scfState) {
    scKey = scfState;
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

  FlatButton _buildUploadButton() {
    return FlatButton(
      color: Theme.of(context).accentColor,
      textColor: Colors.white,
      onPressed: () => _uploadGrades(),
      child: const Text('Upload Grades'),
    );
  }

  void _uploadGrades() async {
    scKey.currentState.hideCurrentSnackBar();
    if (selectorKey.currentState.path == null) {
      scKey.currentState.showSnackBar(
        _buildErrorSnack("You haven't selected a file!"),
      );
      return;
    }

    scKey.currentState.showSnackBar(_loadingSnackBar("Uploading your grades..."));
    DataFetcher.uploadGrades(selectorKey.currentState.path).then((success) {
      scKey.currentState.hideCurrentSnackBar();
      if (success) {
        scKey.currentState.showSnackBar(
          _successSnackBar("Grades uploaded successfully!"),
        );
      } else {
        scKey.currentState.showSnackBar(
          _buildErrorSnack("Something went wrong!"),
        );
      }
    });
  }

  SnackBar _successSnackBar(message) {
    return SnackBar(
      content: new Text(message),
      duration: Duration(milliseconds: 3000),
      backgroundColor: Colors.greenAccent,
    );
  }

  SnackBar _loadingSnackBar(message) {
    return SnackBar(
      content: new Text(message),
      duration: Duration(seconds: 100),
      backgroundColor: Colors.blueAccent,
    );
  }

  SnackBar _buildErrorSnack(String text) {
    return SnackBar(
      content: Text(text),
      backgroundColor: Colors.redAccent,
    );
  }
}

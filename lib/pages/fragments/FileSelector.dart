import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileSelector extends StatefulWidget {
  FileSelector({Key key}) : super(key: key);

  @override
  FileSelectorState createState() => FileSelectorState();
}

class FileSelectorState extends State<FileSelector> {
  String _fileName = "No file selected.";
  File _selectedFile;

  String get path {
    if (_selectedFile != null) {
      return _selectedFile.path;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildSelectionButton(),
        Text(_fileName),
      ],
    );
  }

  void _selectFile() async {
    Scaffold.of(context).hideCurrentSnackBar();
    String path = await FilePicker.getFilePath(
      type: FileType.custom,
      allowedExtensions: ["pdf"], // TODO Do we also accept .html and .htm?
    );
    if (path == null) {
      return;
    }

    setState(() {
      _fileName = path.substring(path.lastIndexOf('/') + 1);
      _selectedFile = File(path);
    });
  }

  RaisedButton _buildSelectionButton() {
    return RaisedButton(
      color: Theme.of(context).scaffoldBackgroundColor,
      textColor: Theme.of(context).accentColor,
      onPressed: () => _selectFile(),
      child: Text('Select file...'),
    );
  }
}

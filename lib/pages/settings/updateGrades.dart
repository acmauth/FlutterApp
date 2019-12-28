import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';

class UpdateGrades extends StatefulWidget {
  @override
  State<UpdateGrades> createState() => UpdateGradesState();
}

class UpdateGradesState extends State<UpdateGrades> {
  final uploader = FlutterUploader();
  String filePath;

  String fileName = "No file Selected.";
  File selectedFile;

  void getFilePath() async {
    String filePath = await FilePicker.getFilePath(type: FileType.ANY);
    if (filePath == '') {
      return;
    }
    print("File path: " + filePath);
    setState(() {
      this.filePath = filePath;
    });

    selectedFile = new File(filePath);
    fileName = basename(selectedFile.path);
  }

  void uploadFile() {
    uploader.enqueue(
        url: "your upload link", //required: url to upload to

        files: [], // required: list of files that you want to upload

        method: UploadMethod.POST, // HTTP method  (POST or PUT or PATCH)

        headers: {"apikey": "api_123456", "userkey": "userkey_123456"},
        data: {"name": "john"}, // any data you want to send in upload request
        showNotification:
            true, // send local notification (android only) for upload status

        tag: "upload 1"); // unique tag for upload task
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Update Grades"),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 50),
            updateAll(),
          ],
        ),
      ),
    );
  }

  Column updateAll() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        selectFileButton(),
        SizedBox(height: 15),
        Text(fileName),
        SizedBox(height: 15),
        uploadButton()
      ],
    );
  }

  Padding uploadButton() {
    return Padding(
      padding: EdgeInsets.only(top: 30, bottom: 30),
      child: Container(
        width: 130,
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(25.0),
            color: Colors.white,
            border: new Border.all(
              color: Colors.blue,
              width: 1,
            )),
        child: FlatButton(
          child: SizedBox(
            width: double.infinity,
            child: Text(
              "Upload Grades",
              style: TextStyle(color: Colors.blue),
              textAlign: TextAlign.center,
            ),
          ),
          onPressed: uploadFile,
        ),
      ),
    );
  }

  Padding selectFileButton() {
    return Padding(
      padding: EdgeInsets.only(top: 30, bottom: 10),
      child: Container(
        width: 130,
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(25.0), color: Colors.blue),
        child: FlatButton(
          child: SizedBox(
            width: double.infinity,
            child: Text(
              "Select File",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          onPressed: getFilePath,
        ),
      ),
    );
  }
}

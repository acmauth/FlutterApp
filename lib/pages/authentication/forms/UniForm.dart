import 'package:flutter/material.dart';

import '../../../Router.dart';
import '../../../entities/user/FormData.dart';

class UniForm extends StatefulWidget {
  UniForm({Key key, this.formData}) : super(key: key);
  @override
  UniFormState createState() => new UniFormState();

  final FormData formData;
}

class UniFormState extends State<UniForm> {
  final GlobalKey<ScaffoldState> scKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  bool inputIsOk = false;

  int studyGroup = -1;
  int attendGroup = -1;
  int privateGroup = -1;
  int degreeGoal = -1;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
      key: scKey,
      appBar: AppBar(
          centerTitle: true,
          title: Text("Page 2/3"),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Router.pop(context),
          )),
      body: ListView(padding: EdgeInsets.all(30), children: <Widget>[
        Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildStudyTimeTiles(),
              SizedBox(height: 20),
              buildAttendanceTiles(),
              SizedBox(height: 20),
              buildPrivateLessonTiles(),
              SizedBox(height: 20),
              buildEducationTiles(),
              SizedBox(height: 20),
              nextButton(),
            ],
          ),
        ),
      ]),
    ));
  }

  Row Header(String title) {
    return Row(children: <Widget>[
      Text(
        title,
        style: TextStyle(color: Colors.blue, fontSize: 16),
      )
    ]);
  }

  Column buildStudyTimeTiles() {
    return Column(
      children: <Widget>[
        Header("Average weekly study time: "),
        Column(
          children: <Widget>[
            RadioListTile(
              value: 0,
              groupValue: studyGroup,
              title: Text(
                "0 - 2 hours",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (val) => setState(() => studyGroup = val),
            ),
            RadioListTile(
              value: 1,
              groupValue: studyGroup,
              title: Text(
                "2 - 5 hours",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (val) => setState(() => studyGroup = val),
            ),
            RadioListTile(
              value: 2,
              groupValue: studyGroup,
              title: Text(
                "5 or more hours",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (val) => setState(() => studyGroup = val),
            ),
          ],
        )
      ],
    );
  }

  Column buildAttendanceTiles() {
    return Column(children: <Widget>[
      Header("I attend:"),
      Column(
        children: <Widget>[
          RadioListTile(
            value: 0,
            groupValue: attendGroup,
            title: Text(
              "All lectures",
              style: TextStyle(color: Colors.black),
            ),
            onChanged: (val) => setState(() => attendGroup = val),
          ),
          RadioListTile(
            value: 1,
            groupValue: attendGroup,
            title: Text(
              "More than half of the lectures",
              style: TextStyle(color: Colors.black),
            ),
            onChanged: (val) => setState(() => attendGroup = val),
          ),
          RadioListTile(
            value: 2,
            groupValue: attendGroup,
            title: Text(
              "Half the lectures",
              style: TextStyle(color: Colors.black),
            ),
            onChanged: (val) => setState(() => attendGroup = val),
          ),
          RadioListTile(
            value: 3,
            groupValue: attendGroup,
            title: Text(
              "Less than half of the lectures",
              style: TextStyle(color: Colors.black),
            ),
            onChanged: (val) => setState(() => attendGroup = val),
          ),
          RadioListTile(
            value: 4,
            groupValue: attendGroup,
            title: Text(
              "None of the lectures",
              style: TextStyle(color: Colors.black),
            ),
            onChanged: (val) => setState(() => attendGroup = val),
          ),
        ],
      )
    ]);
  }

  Column buildPrivateLessonTiles() {
    return Column(
      children: <Widget>[
        Header("I am attending private lessons: "),
        Column(
          children: <Widget>[
            RadioListTile(
              value: 0,
              groupValue: privateGroup,
              title: Text(
                "Yes",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (val) => setState(() => privateGroup = val),
            ),
            RadioListTile(
              value: 1,
              groupValue: privateGroup,
              title: Text(
                "No",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (val) => setState(() => privateGroup = val),
            ),
          ],
        )
      ],
    );
  }

  Column buildEducationTiles() {
    return Column(
      children: <Widget>[
        Header("After my degree I would go for: "),
        Column(
          children: <Widget>[
            RadioListTile(
              value: 0,
              groupValue: degreeGoal,
              title: Text(
                "MSc degree",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (val) => setState(() => degreeGoal = val),
            ),
            RadioListTile(
              value: 1,
              groupValue: degreeGoal,
              title: Text(
                "Phd degree",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (val) => setState(() => degreeGoal = val),
            ),
            RadioListTile(
              value: 2,
              groupValue: degreeGoal,
              title: Text(
                "No further education",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (val) => setState(() => degreeGoal = val),
            ),
          ],
        )
      ],
    );
  }

  Padding nextButton() {
    return Padding(
      padding: EdgeInsets.only(top: 30, left: 60, right: 60),
      child: Container(
        color: Colors.blue,
        child: FlatButton(
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "Next",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            onPressed: () {
              validateInput();
              if (inputIsOk) {
                saveData();
                loadNext();
              }
            }),
      ),
    );
  }

  void validateInput() {
    final form = formKey.currentState;
    if (form.validate()) {
      if (studyGroup < 0)
        showSnackBar("Please enter your study time!");
      else if (attendGroup < 0)
        showSnackBar('Please enter hours of attendance!');
      else if (privateGroup < 0)
        showSnackBar('Please etner Private Lessons!');
      else if (degreeGoal < 0)
        showSnackBar('Please enter your degree goal!');
      else {
        inputIsOk = true;
        form.save();
      }
    }
  }

  void loadNext() {
    Router.push(context, '/form/misc', args: widget.formData);
  }

  void saveData() {
    getStudyTime();
    getAttendance();
    getPrivateLesson();
    getPostGraduate();
  }

  void getStudyTime() {
    switch (studyGroup) {
      case 0:
        widget.formData.studyTime = 0;
        break;
      case 1:
        widget.formData.studyTime = 2;
        break;
      case 2:
        widget.formData.studyTime = 5;
        break;
    }
  }

  void getAttendance() {
    switch (attendGroup) {
      case 0:
        widget.formData.lectures = "All lectures";
        break;
      case 1:
        widget.formData.lectures = "More than half the lectures";
        break;
      case 2:
        widget.formData.lectures = "Half the lectures";
        break;
      case 3:
        widget.formData.lectures = "Less than half the lectures";
        break;
      case 4:
        widget.formData.lectures = "None of the lectures";
        break;
    }
  }

  void getPrivateLesson() {
    if (privateGroup == 0)
      widget.formData.privateLessons = true;
    else
      widget.formData.privateLessons = false;
  }

  void getPostGraduate() {
    switch (degreeGoal) {
      case 0:
        widget.formData.postgraduate = "MSc degree";
        break;
      case 1:
        widget.formData.postgraduate = "PhD degree";
        break;
      case 2:
        widget.formData.postgraduate = "No further education";
        break;
    }
  }

  void showSnackBar(message) {
    final snackBar = new SnackBar(
      content: new Text(message),
      duration: Duration(milliseconds: 500),
    );
    scKey.currentState.showSnackBar(snackBar);
  }
}

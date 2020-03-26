import 'package:flutter/material.dart';

import '../../../DataFetcher.dart';
import '../../../Router.dart';
import '../../../entities/user/FormData.dart';
import '../../fragments/BlankPadding.dart';
import '../../fragments/FileSelector.dart';
import '../../fragments/StyledText.dart';

class MiscForm extends StatefulWidget {
  MiscForm({Key key, this.formData}) : super(key: key);
  @override
  MiscFormState createState() => new MiscFormState();

  final FormData formData;
}

class MiscFormState extends State<MiscForm> {
  final GlobalKey<ScaffoldState> scKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final gradesKey = GlobalKey<FileSelectorState>();

  bool inputIsOk = false;

  static bool sportSelect = false;
  static bool gameSelect = false;
  static bool langSelect = false;
  static bool movieSelect = false;
  static bool volSelect = false;
  String currentSemester = "1";

  int houseGroup = -1;
  int distanceGroup = -1;

  List<String> formHobbies = new List();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
          key: scKey,
          appBar: AppBar(
              centerTitle: true,
              title: Text("Form 3 of 3"),
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
                  getHouse(),
                  BlankPadding(),
                  getSchoolDistance(),
                  BlankPadding(),
                  getFavSubjects(),
                  BlankPadding(),
                  getSemester(),
                  BlankPadding(),
                  getGrades(),
                  BlankPadding(),
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

  Column getHouse() {
    return Column(
      children: <Widget>[
        Header("Which of the following is true: "),
        Column(
          children: <Widget>[
            RadioListTile(
              value: 0,
              groupValue: houseGroup,
              title: Text(
                "I live on my own",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (val) => setState(() => houseGroup = val),
            ),
            RadioListTile(
              value: 1,
              groupValue: houseGroup,
              title: Text(
                "I live with a friend",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (val) => setState(() => houseGroup = val),
            ),
            RadioListTile(
              value: 2,
              groupValue: houseGroup,
              title: Text(
                "I live with my brother",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (val) => setState(() => houseGroup = val),
            ),
            RadioListTile(
              value: 3,
              groupValue: houseGroup,
              title: Text(
                "I live with my parents",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (val) => setState(() => houseGroup = val),
            )
          ],
        )
      ],
    );
  }

  Column getSchoolDistance() {
    return Column(children: <Widget>[
      Header("How far away is your school?"),
      Column(
        children: <Widget>[
          RadioListTile(
            value: 0,
            groupValue: distanceGroup,
            title: Text(
              "Less than 10 minutes",
              style: TextStyle(color: Colors.black),
            ),
            onChanged: (val) => setState(() => distanceGroup = val),
          ),
          RadioListTile(
            value: 1,
            groupValue: distanceGroup,
            title: Text(
              "10 - 25 minutes",
              style: TextStyle(color: Colors.black),
            ),
            onChanged: (val) => setState(() => distanceGroup = val),
          ),
          RadioListTile(
            value: 2,
            groupValue: distanceGroup,
            title: Text(
              "25 - 40 minutes",
              style: TextStyle(color: Colors.black),
            ),
            onChanged: (val) => setState(() => distanceGroup = val),
          ),
          RadioListTile(
            value: 3,
            groupValue: distanceGroup,
            title: Text(
              "More than 40 minutes",
              style: TextStyle(color: Colors.black),
            ),
            onChanged: (val) => setState(() => distanceGroup = val),
          ),
        ],
      )
    ]);
  }

  Column getFavSubjects() {
    return Column(
      children: <Widget>[
        Header("How do you spent your free time? "),
        Column(
          children: <Widget>[
            CheckboxListTile(
              value: sportSelect,
              title: Text(
                "Sports",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (bool val) => setState(() => sportSelect = val),
            ),
            CheckboxListTile(
              value: gameSelect,
              title: Text(
                "Video Games",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (bool val) => setState(() => gameSelect = val),
            ),
            CheckboxListTile(
              value: langSelect,
              title: Text(
                "Foreign language",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (bool val) => setState(() => langSelect = val),
            ),
            CheckboxListTile(
              value: movieSelect,
              title: Text(
                "Movies / Series",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (bool val) => setState(() => movieSelect = val),
            ),
            CheckboxListTile(
              value: volSelect,
              title: Text(
                "Volunteering",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (bool val) => setState(() => volSelect = val),
            ),
          ],
        )
      ],
    );
  }

  Row getSemester() {
    return Row(children: <Widget>[
      Expanded(
          child: Text(
            "Current Semester: ",
            style: TextStyle(color: Colors.blue, fontSize: 16),
          )),
      Container(
        width: 60,
        child: DropdownButton<String>(
          items: <String>["1", "2", "3", "4", "5", "6", "7", "8"]
              .map((String value) {
            return new DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(value),
                ));
          }).toList(),
          value: currentSemester,
          onChanged: (String val) {
            setState(() {
              currentSemester = val;
            });
          },
        ),
      )
    ]);
  }

  Column getGrades() {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: StyledText(
            "Upload your grades:",
            size: 16,
          ),
        ),
        FileSelector(key: gradesKey),
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
                "SUBMIT",
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
      if (houseGroup < 0)
        showSnackBar("Please enter house option!");
      else if (distanceGroup < 0)
        showSnackBar('Please enter your school distance!');
      else if (gradesKey.currentState.path == null)
        showSnackBar('Please select your grades file!');
      else {
        inputIsOk = true;
        form.save();
      }
    }
  }

  void showSnackBar(message) {
    final snackBar = new SnackBar(
      content: new Text(message),
      duration: Duration(milliseconds: 500),
    );
    scKey.currentState.showSnackBar(snackBar);
  }


  void getRoommate() {
    switch (houseGroup) {
      case 0:
        widget.formData.roommate = "I live on my own";
        break;
      case 1:
        widget.formData.roommate = "I live with a friend";
        break;
      case 2:
        widget.formData.roommate = "I live with my brother";
        break;
      case 3:
        widget.formData.roommate = "I live with my parents";
        break;
    }
  }

  void getDistance() {
    switch (distanceGroup) {
      case 0:
        widget.formData.distance = "Less than 10 minutes";
        break;
      case 1:
        widget.formData.distance = "10 - 25 minutes";
        break;
      case 2:
        widget.formData.distance = "25 - 40 minutes";
        break;
      case 3:
        widget.formData.distance = "More than 40 minutes";
        break;
    }
  }

  void getHobbies() {
    if (sportSelect) formHobbies.add("Sports");
    if (gameSelect) formHobbies.add("Video Games");
    if (langSelect) formHobbies.add("Foreign Language");
    if (movieSelect) formHobbies.add("Movies / Series");
    if (volSelect) formHobbies.add("Volunteering");

    widget.formData.hobbies = formHobbies;
  }


  void saveData() {
    getRoommate();
    getDistance();
    getHobbies();
    widget.formData.semester = int.parse(currentSemester);
    widget.formData.gradesPath = gradesKey.currentState.path;
  }

  void loadNext() {
    DataFetcher.fetchFormData(widget.formData).then((success) {
      if (success) {
        Router.replaceAll(context, '/home');
      } else {
        showSnackBar("Something went wrong!");
      }
    });
  }

}

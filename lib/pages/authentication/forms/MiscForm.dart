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
  final TextEditingController otherHobby = new TextEditingController();

  bool inputIsOk = false;

  static bool sportSelect = false;
  static bool gameSelect = false;
  static bool langSelect = false;
  static bool movieSelect = false;
  static bool volSelect = false;
  static bool otherSelect = false;

  int houseGroup = -1;
  int distanceGroup = -1;
  String currentSemester = "";

  List<String> formHobbies = new List();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
      key: scKey,
      appBar: AppBar(
          centerTitle: true,
          title: Text("Page 3/3"),
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
              currentSemester != "1" && currentSemester != "" ?  getGrades() : BlankPadding(),
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
      Header("How far away is your school:"),
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
        Header("How do you spent your free time:"),
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
                "Movies/Series",
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
            CheckboxListTile(
              value: otherSelect,
              title: Text(
                "Other",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (bool val) => setState(() => otherSelect = val),
            ),

            otherSelect ?
                Padding(
                    padding: EdgeInsets.only(left: 15, right: 20),
                    child: TextFormField(
                      controller: otherHobby,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(hintText: "Please specify"),
                    )
                ):

            Text("")
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
        child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 5),
                  child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "1-99"),
                  onChanged: (val) => setState(() => currentSemester = val),
              )
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
//        padding: EdgeInsets.all(20),
        child: FlatButton(
          color: Theme.of(context).accentColor,
          textColor: Colors.white,
          onPressed: () => _uploadUserData(),
          child: const Text('Submit'),
        ),
      ),
    );
  }

  bool validateInput() {
    final form = formKey.currentState;
    if (form.validate()) {
      if (houseGroup < 0)
        showSnackBar("Please enter house option!");
      else if (distanceGroup < 0)
        showSnackBar('Please enter your school distance!');
      else if(int.parse(currentSemester) < 0 || int.parse(currentSemester) > 100)
        showSnackBar('Enter a valid semester value!');
      else if(currentSemester != "1"){
        if (gradesKey.currentState.path == null)
          showSnackBar('Please select your grades file!');
        else{
          form.save();
          return true;
        }
      }
      else {
        form.save();
        return true;
      }
    }
    return false;
  }

  void showSnackBar(message) {
    final snackBar = new SnackBar(
      content: new Text(message),
      duration: Duration(milliseconds: 1000),
    );
    scKey.currentState.showSnackBar(snackBar);
  }

  void getRoommate() {
    switch (houseGroup) {
      case 0:
        widget.formData.roomates = "I live on my own";
        break;
      case 1:
        widget.formData.roomates = "I live with a friend";
        break;
      case 2:
        widget.formData.roomates = "I live with my brother";
        break;
      case 3:
        widget.formData.roomates = "I live with my parents";
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
    if (otherSelect) formHobbies.add(otherHobby.text);

    widget.formData.hobbies = formHobbies;
  }

  void saveData() {
    getRoommate();
    getDistance();
    getHobbies();
    widget.formData.semester = int.parse(currentSemester);
  }

  _uploadUserData() {
    if (validateInput()) {
      saveData();
      scKey.currentState
          .showSnackBar(_loadingSnackBar("Uploading your info..."));

      if(currentSemester != "1"){
        DataFetcher.uploadGrades(gradesKey.currentState.path).then((success) {
          scKey.currentState.hideCurrentSnackBar();
          if (success) {
            scKey.currentState.showSnackBar(
              _successSnackBar("Grades uploaded successfully!"),
            );
            DataFetcher.uploadFormData(widget.formData).then((innerSuccess) {
              if (innerSuccess) {
                Router.formComplete(context);
              } else {
                _buildErrorSnack("Something went wrong!");
              }
            });
          } else {
            scKey.currentState.showSnackBar(
              _buildErrorSnack("Something went wrong!"),
            );
          }
        });
      }
      else if(currentSemester == "1") {
        DataFetcher.uploadFormData(widget.formData).then((success) {
          if (success) {
            Router.formComplete(context);
          } else {
            _buildErrorSnack("Something went wrong!");
          }
        });
      }

    }
  }

  SnackBar _successSnackBar(message) {
    return SnackBar(
      content: new Text(message),
      duration: Duration(milliseconds: 1000),
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

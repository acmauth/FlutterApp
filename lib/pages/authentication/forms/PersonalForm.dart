import 'package:flutter/material.dart';

import '../../../Router.dart';
import '../../../entities/user/FormData.dart';

class PersonalForm extends StatefulWidget {
  PersonalForm({Key key}) : super(key: key);
  @override
  PersonalFormState createState() => new PersonalFormState();
}

class PersonalFormState extends State<PersonalForm> {
  final FormData formData = new FormData();

  final GlobalKey<ScaffoldState> scKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final TextEditingController username = new TextEditingController();

  bool inputIsOk = false;

  int genderGroup = -1;
  int schoolGroup = -1;
  int prefGroup = -1;

  String choice1;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
          key: scKey,
          appBar: AppBar(
            centerTitle: true,
            title: Text("Form 1 of 3"),
            backgroundColor: Colors.blue,
          ),
          body: ListView(padding: EdgeInsets.all(30), children: <Widget>[
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  buildAgeField(),
                  SizedBox(height: 20),
                  buildGenderTiles(),
                  SizedBox(height: 20),
                  buildSchoolTiles(),
                  SizedBox(height: 20),
                  buildReasonTiles(),
                  SizedBox(height: 20),
                  nextButton(),
                  SizedBox(height: 10),
                ],
              ),
            )
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

  Column buildAgeField() {
    return Column(
      children: <Widget>[
        Header("AGE"),
        TextFormField(
          controller: username,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: "Enter your name..."),
        )
      ],
    );
  }

  Column buildGenderTiles() {
    return Column(
      children: <Widget>[
        Header("Gender"),
        Column(
          children: <Widget>[
            RadioListTile(
              value: 0,
              groupValue: genderGroup,
              title: Text(
                "Male",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (val) => setState(() => genderGroup = val),
            ),
            RadioListTile(
              value: 1,
              groupValue: genderGroup,
              title: Text(
                "Female",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (val) => setState(() => genderGroup = val),
            ),
          ],
        )
      ],
    );
  }

  Column buildSchoolTiles() {
    return Column(children: <Widget>[
      Header("School Name"),
      Column(
        children: <Widget>[
          RadioListTile(
            value: 0,
            groupValue: schoolGroup,
            title: Text(
              "Computer Science",
              style: TextStyle(color: Colors.black),
            ),
            onChanged: (val) => setState(() => schoolGroup = val),
          ),
          RadioListTile(
            value: 1,
            groupValue: schoolGroup,
            title: Text(
              "Electrical Engineering",
              style: TextStyle(color: Colors.black),
            ),
            onChanged: (val) => setState(() => schoolGroup = val),
          ),
          RadioListTile(
            value: 2,
            groupValue: schoolGroup,
            title: Text(
              "Other",
              style: TextStyle(color: Colors.black),
            ),
            onChanged: (val) => setState(() => schoolGroup = val),
          ),
        ],
      )
    ]);
  }

  Column buildReasonTiles() {
    return Column(
      children: <Widget>[
        Header("I chosed this school because: "),
        Column(
          children: <Widget>[
            RadioListTile(
              value: 0,
              groupValue: prefGroup,
              title: Text(
                "I'm intrested in computer Science",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (val) => setState(() => prefGroup = val),
            ),
            RadioListTile(
              value: 1,
              groupValue: prefGroup,
              title: Text(
                "Professional Rehabiliation",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (val) => setState(() => prefGroup = val),
            ),
            RadioListTile(
              value: 2,
              groupValue: prefGroup,
              title: Text(
                "School's Status",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (val) => setState(() => prefGroup = val),
            ),
            RadioListTile(
              value: 3,
              groupValue: prefGroup,
              title: Text(
                "Parents' Work",
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (val) => setState(() => prefGroup = val),
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
                "NEXT",
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
      if (username.text.isEmpty)
        showSnackBar("Please enter your name!");
      else if (genderGroup < 0)
        showSnackBar('Please select your gender');
      else if (schoolGroup < 0)
        showSnackBar('Please select your school');
      else if (prefGroup < 0)
        showSnackBar('Please select your preference');
      else {
        inputIsOk = true;
        form.save();
      }
    }
  }

  void saveData() {
    formData.name = username.text;
    getReason();
  }

  void loadNext() {
    Router.push(context, '/form/uni', args: formData);
  }

  void getReason() {
    switch (prefGroup) {
      case 0:
        formData.reason = "Intrested in subject";
        break;
      case 1:
        formData.reason = "Professional Rehabiliation";
        break;
      case 2:
        formData.reason = "School's Status";
        break;
      case 3:
        formData.reason = "Parents' Work";
        break;
    }
  }

  void getSchool(){
    switch(schoolGroup){
      case 0:
        formData.school = "ComputerScience";
        break;
      case 1:
        formData.school = "Electrical Engineering";
        break;
      case 2:
        formData.school = "Other";
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

import 'package:flutter/material.dart';
import 'package:grade_plus_plus/entities/user/FormData.dart';
import 'package:grade_plus_plus/pages/HomeScreen.dart';

class screen3 extends StatefulWidget {
  screen3({ Key key, this.formData }) : super(key: key);
  @override
  screen3State createState() => new screen3State();

  final FormData formData;
}

class screen3State extends State<screen3> {
  final GlobalKey<ScaffoldState> scKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  bool inputIsOk = false;


  int houseGroup = -1;
  int distanceGroup = -1;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
          key: scKey,
          appBar: AppBar(
            centerTitle: true,
            title: Text("Form 3 of 3"),
            backgroundColor: Colors.blue,
              leading: IconButton(icon:Icon(Icons.arrow_back),
                onPressed:() => Navigator.pop(context, false),
              )
          ),
          body: ListView(
              padding: EdgeInsets.all(30),
              children: <Widget>[
                Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      getHouse(),
                      SizedBox(height: 20),
                      getSchoolDistance(),
                      SizedBox(height: 20),
                      getFavSubjects(),
                      nextButton(),
                    ],
                  ),
                ),
              ]
          ),
        )
    );
  }

  Row Header(String title){
    return Row(children: <Widget>[
      Text(title, style: TextStyle(color: Colors.blue),)]
    );
  }

  Column getHouse(){
    return Column(
      children: <Widget>[
        Header("Which of the following is true: "),
        Column(
          children: <Widget>[
            RadioListTile(
              value: 0,
              groupValue: houseGroup,
              title: Text("I live on my own", style: TextStyle(color: Colors.black),),
              onChanged: (val) => setState(() => houseGroup  = val),
            ),
            RadioListTile(
              value: 1,
              groupValue: houseGroup,
              title: Text("I live with a friend", style: TextStyle(color: Colors.black),),
              onChanged: (val) => setState(() => houseGroup  = val),
            ),
            RadioListTile(
              value: 2,
              groupValue: houseGroup,
              title: Text("I live with my brother", style: TextStyle(color: Colors.black),),
              onChanged: (val) => setState(() => houseGroup  = val),
            ),
            RadioListTile(
              value: 3,
              groupValue: houseGroup,
              title: Text("I live with my parents", style: TextStyle(color: Colors.black),),
              onChanged: (val) => setState(() => houseGroup  = val),
            )
          ],
        )
      ],
    );
  }

  Column getSchoolDistance(){
    return Column(
        children: <Widget>[
          Header("How far away is your school?"),
          Column(
            children: <Widget>[
              RadioListTile(
                value: 0,
                groupValue: distanceGroup,
                title: Text("Less than 10 minutes", style: TextStyle(color: Colors.black),),
                onChanged: (val) => setState(() => distanceGroup  = val),
              ),
              RadioListTile(
                value: 1,
                groupValue: distanceGroup,
                title: Text("10 - 25 minutes", style: TextStyle(color: Colors.black),),
                onChanged: (val) => setState(() => distanceGroup  = val),
              ),
              RadioListTile(
                value: 2,
                groupValue: distanceGroup,
                title: Text("25 - 40 minutes", style: TextStyle(color: Colors.black),),
                onChanged: (val) => setState(() => distanceGroup  = val),
              ),
              RadioListTile(
                value: 3,
                groupValue: distanceGroup,
                title: Text("More than 40 minutes", style: TextStyle(color: Colors.black),),
                onChanged: (val) => setState(() => distanceGroup  = val),
              ),
            ],
          )
        ]
    );
  }

  Column getFavSubjects(){

    bool isSelected = false;
    return Column(
      children: <Widget>[
        Header("How do you spent your free time? "),
        Column(
          children: <Widget>[
            CheckboxListTile(
              value: isSelected,
              title: Text("Sports", style: TextStyle(color: Colors.black),),
              onChanged: (bool val) => setState(() => isSelected = true ),
            ),
            CheckboxListTile(
              value: isSelected,
              title: Text("Video Games", style: TextStyle(color: Colors.black),),
              onChanged: (bool val) => setState(() => isSelected = val),
            ),
            CheckboxListTile(
              value: isSelected,
              title: Text("Foreign language", style: TextStyle(color: Colors.black),),
              onChanged: (bool val) => setState(() => isSelected = val),
            ),
            CheckboxListTile(
              value: isSelected,
              title: Text("Movies / Series", style: TextStyle(color: Colors.black),),
              onChanged: (bool val) => setState(() => isSelected = val),
            ),
            CheckboxListTile(
              value: isSelected,
              title: Text("Volunteering", style: TextStyle(color: Colors.black),),
              onChanged: (bool val) => setState(() => isSelected = val),
            ),
          ],
        )
      ],
    );
  }

  Padding nextButton(){
    return Padding(
      padding: EdgeInsets.only(top:30, left: 60, right: 60),
      child: Container(
        color: Colors.blue,
        child: FlatButton(
            child: SizedBox(
              width: double.infinity,
              child: Text("SUBMIT",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            onPressed: (){
              validateInput();
              if(inputIsOk){
                saveData();
                loadNext();
                printData();
              }
            }
        ),
      ) ,
    );
  }

  void loadNext(){
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (__) => new HomeScreen()
        )
    );
  }

  void validateInput() {
    final form = formKey.currentState;
    if (form.validate()) {
      if(houseGroup < 0)
        showSnackBar("Please enter house option!");
      else if (distanceGroup < 0)
        showSnackBar('Please enter your school distance!');
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

  void saveData(){
    getRoommate();
    getDistance();
  }

  //Testing
  void printData(){
    print(widget.formData.privateLessons);
    print("Reason: " + widget.formData.reason);
    print("Study: " + widget.formData.studyTime);
    print("Attend: " + widget.formData.lectures);
    print("Degree: " + widget.formData.postGraduate);
    print("Live: " + widget.formData.roommate);
    print("Distance: " + widget.formData.distance);
  }

  void getRoommate(){
    switch(houseGroup){
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

  void getDistance(){
    switch(distanceGroup){
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

}
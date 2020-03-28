import 'package:flutter/material.dart';

import '../../Router.dart';
import '../../entities/user/UserCredentials.dart';
import '../../DataFetcher.dart';

class ChangePassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChangePasswordState();
}

class ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<ScaffoldState> scKey = new GlobalKey<ScaffoldState>();
  static GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  final TextEditingController newPass = new TextEditingController();
  final TextEditingController oldPass = new TextEditingController();

  final FocusNode newPassNode = FocusNode();
  final FocusNode verPassNode = FocusNode();

  //For Testing

  UserCredentials userCred = new UserCredentials();
  ChangePasswordState() {
    userCred.password = "qwerty";
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
      key: scKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Profile"),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Router.pop(context);
          },
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(padding: EdgeInsets.all(30), children: <Widget>[
          Column(
            children: <Widget>[
              curPassField(),
              SizedBox(height: 20),
              newPassField(),
              SizedBox(height: 20),
              verPassField(),
              SizedBox(height: 20),
              SaveButton()
            ],
          ),
        ]),
      ),
    ));
  }

  Container curPassField() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      child: TextFormField(
        controller: oldPass,
        textInputAction: TextInputAction.next,
        obscureText: true,
        autofocus: true,
        onFieldSubmitted: (_) {
          newPassNode.requestFocus();
        },
        decoration: new InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
          hintText: "Current password",
          //border: InputBorder.none
        ),
      ),
    );
  }

  Container newPassField() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      child: TextFormField(
        controller: newPass,
        focusNode: newPassNode,
        textInputAction: TextInputAction.next,
        validator: checkPass,
        obscureText: true,
        onFieldSubmitted: (val) {
          verPassNode.requestFocus();
        },
        decoration: new InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
          hintText: "New password",
          //border: InputBorder.none
        ),
      ),
    );
  }

  Container verPassField() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      child: TextFormField(
        focusNode: verPassNode,
        textInputAction: TextInputAction.done,
        obscureText: true,
        validator: checkMatch,
        decoration: new InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
          hintText: "New password, again",
          //border: InputBorder.none
        ),
      ),
    );
  }

  Padding SaveButton() {
    return Padding(
      padding: EdgeInsets.only(top: 30, left: 60, right: 60),
      child: Container(
        color: Colors.blue,
        child: FlatButton(
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "SAVE CHANGES",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            onPressed: () {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();
                _changePassword(oldPass.text, newPass.text).then((succ) {
                  if (succ) {
                    showSnackBar("Password successfully changed!");
                    Future.delayed(Duration(seconds: 2), () {
                      Router.pop(context);
                    });
                  } else {
                    showSnackBar("Old password not correct! Please retry.");
                  }
                });
              }
            }),
      ),
    );
  }

  String checkPass(String val) {
    return val.length < 5 ? "Password can't be less than 5 characters!" : null;
  }

  String checkMatch(String val) {
    return val != newPass.text ? "Passwords don't match!" : null;
  }

  void showSnackBar(message) {
    final snackBar = new SnackBar(
      content: new Text(message),
      duration: Duration(milliseconds: 1000),
    );
    scKey.currentState.showSnackBar(snackBar);
  }

  Future<bool> _changePassword(oldPass, newPass) async {
    return DataFetcher.changePassword(oldPass, newPass);
  }
}

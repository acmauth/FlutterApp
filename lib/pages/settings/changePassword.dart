import 'package:flutter/material.dart';
import '../fragments/PasswordField.dart';

class changePassword extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => changePasswordState();

}

class changePasswordState extends State<changePassword>{



  final GlobalKey<FormFieldState<dynamic>> oldPwdKey =
  GlobalKey<FormFieldState<dynamic>>();
  final GlobalKey<FormFieldState<dynamic>> _pwdKey =
  GlobalKey<FormFieldState<dynamic>>();
  final GlobalKey<FormFieldState<dynamic>> _pwdConfirmKey =
  GlobalKey<FormFieldState<dynamic>>();

  static String _pwd, _pwdConfirm;

  final FocusNode _pwdNode = FocusNode();
  final FocusNode _pwdConfirmNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Password"),
        backgroundColor: Colors.blue,
        ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 25),
            buildPassField(),
            SizedBox(height: 25),
            buildPassConfField(),
            SizedBox(height: 25),
            //actionButton("Save changes", Colors.blue, Colors.white, o),
            SizedBox(height: 25),
           // actionButton("Cancel", Colors.grey[100], Colors.blue, onTap: cancel)
          ],
        ),
      ),
      )
    );
  }

  Widget buildPassField(){
    return  PasswordField(
      key: _pwdKey,
      textInputAction: TextInputAction.next,
      onSaved: (String value) => _pwd = value,
      focusNode: _pwdNode,
      validator: _doCheckPassword,
      hintText: 'New Password',
      onFieldSubmitted: () => _pwdConfirmNode.requestFocus(),
    );
  }

  String _doCheckPassword(String password) {
    return password.length < 5
        ? 'Please enter a password longer than 5 characters!'
        : null;
  }

  Widget buildPassConfField(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue),
      ),
      child: PasswordField(
        key: _pwdConfirmKey,
        textInputAction: TextInputAction.done,
        onSaved: (String value) => _pwdConfirm = value,
        focusNode: _pwdConfirmNode,
        validator: (String value) => _pwdConfirm != _pwd  ? "The passwords you entered don't match!" : null,
        hintText: 'Confirm Password',
        onFieldSubmitted: null,
      ),
    );
  }


}

class actionButton extends StatelessWidget{
  final String title;
  final Color bgColor;
  final Color txtColor;
  final VoidCallback onTap;

  actionButton(this.title, this.bgColor, this.txtColor, {this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          color: this.bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: FlatButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: SizedBox(
              width: double.infinity,
              child: Text(
                this.title,
                style: TextStyle(
                    color: this.txtColor),
                    textAlign: TextAlign.center,
              ),
            ),
            onPressed: this.onTap
        ),
      ) ,
    );
  }

}
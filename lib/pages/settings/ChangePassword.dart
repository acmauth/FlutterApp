import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/AbstractPage.dart';
import 'package:grade_plus_plus/pages/fragments/BlankPadding.dart';
import 'package:grade_plus_plus/pages/fragments/PasswordField.dart';

import '../../DataFetcher.dart';
import '../../Router.dart' as nav;
import '../../entities/user/UserCredentials.dart';
import '../AbstractPage.dart';

class ChangePassword extends AbstractPage {
  ChangePassword({Key key})
      : super(
          key: key,
          appBarTitle: 'Change Password',
          appBarColorBg: Colors.blue,
          appBarColorTxt: Colors.white,
        );

  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends PageState<ChangePassword> {
  GlobalKey<ScaffoldState> _scfKey;
  static GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  final GlobalKey<FormFieldState<dynamic>> curPassKey =
      GlobalKey<FormFieldState<dynamic>>();
  final GlobalKey<FormFieldState<dynamic>> newPassKey =
      GlobalKey<FormFieldState<dynamic>>();
  final GlobalKey<FormFieldState<dynamic>> verPassKey =
      GlobalKey<FormFieldState<dynamic>>();

  static String _currPass, _newPass, _verPass;

  final FocusNode currPassNode = FocusNode();
  final FocusNode newPassNode = FocusNode();
  final FocusNode verPassNode = FocusNode();

  //For Testing

  UserCredentials userCred = new UserCredentials();

  _ChangePasswordState() {
    userCred.password = "qwerty";
  }

  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    _scfKey = scfKey;
    return Container(
      padding: const EdgeInsets.all(30),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            _buildPasswordFields(),
            SizedBox(height: 20),
            _saveButton()
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordFields() {
    return Column(
      children: <Widget>[
        PasswordField(
          key: curPassKey,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: () => newPassNode.requestFocus(),
          hintText: "Current Password",
          focusNode: currPassNode,
          validator: _doCheckPassword,
          onSaved: (String value) => _currPass = value,
        ),
        BlankPadding(),
        PasswordField(
          key: newPassKey,
          textInputAction: TextInputAction.next,
          onSaved: (String value) => _newPass = value,
          onFieldSubmitted: () => verPassNode.requestFocus(),
          hintText: "New Password",
          focusNode: newPassNode,
          validator: _doCheckPassword,
        ),
        BlankPadding(),
        PasswordField(
          key: verPassKey,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: _doValidate,
          hintText: "Confirm New Password",
          focusNode: verPassNode,
          validator: (String value) => _verPass != _newPass
              ? "The passwords you entered don't match!"
              : null,
          onSaved: (String value) => _verPass = value,
        ),
      ],
    );
  }

  FlatButton _saveButton() {
    return FlatButton(
      color: Theme.of(context).accentColor,
      textColor: Colors.white,
      onPressed: () => _doValidate(),
      child: const Text('Save'),
    );
  }

  String _doCheckPassword(String password) {
    return password.length < 5
        ? 'Please enter a password longer than 5 characters!'
        : null;
  }

  void _doValidate() {
    _unfocus();
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      _changePassword(_currPass, _newPass).then((succ) {
        if (succ) {
          showSnackBar("Password successfully changed!");
          Future.delayed(Duration(seconds: 2), () {
            nav.Router.pop(context);
          });
        } else {
          showSnackBar("Old password not correct! Please retry.");
        }
      });
    }
  }

  void _unfocus() {
    currPassNode.unfocus();
    newPassNode.unfocus();
    verPassNode.unfocus();
  }

  void showSnackBar(message) {
    final snackBar = new SnackBar(
      content: new Text(message),
      duration: Duration(milliseconds: 1000),
    );
    _scfKey.currentState.showSnackBar(snackBar);
  }

  Future<bool> _changePassword(oldPass, newPass) async {
    return DataFetcher.changePassword(oldPass, newPass);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_plus_plus/bloc/auth/exports.dart';
import 'package:grade_plus_plus/pages/fragments/exports.dart';

abstract class AuthPage extends StatefulWidget {
  AuthPage({
    Key key,
    @required this.verify,
    @required this.color,
    @required this.action,
    @required this.altMessage,
    @required this.uniEvent,
    @required this.switchEvent,
  }) : super(key: key);

  final dynamic verify;
  final Color color;
  final String action;
  final String altMessage;
  final AuthEvent uniEvent;
  final AuthEvent switchEvent;

  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final pad = Padding(padding: EdgeInsets.all(10));

    String email;
    String pwd;

    _doAction() {
      final success = widget.verify(email, pwd);
      authBloc.dispatch(success ? Success() : Fail());
    }

    _doValidate() {
      final form = formKey.currentState;
      if (form.validate()) {
        form.save();
        _doAction();
      }
    }

    FocusNode _emailNode;
    FocusNode _pwdNode;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.action),
        backgroundColor: widget.color,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    "assets/logo.png",
                    width: 100,
                  ),
                  pad,
                  Text(
                    "Grade++",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              pad,
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onSaved: (value) => email = value,
                focusNode: _emailNode,
                validator: (value) =>
                    value.length < 3 ? "Please enter an email!" : null,
                decoration: InputDecoration(
                  hintText: "me@auth.gr",
                  icon: Icon(Icons.email),
                ),
                onFieldSubmitted: (_) {
                  _emailNode.unfocus();
                  FocusScope.of(context).requestFocus(_pwdNode);
                },
              ),
              pad,
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onSaved: (value) => pwd = value,
                focusNode: _pwdNode,
                validator: (value) => value.length < 5
                    ? "Please enter a password longer than 5 characters!"
                    : null,
                decoration: InputDecoration(
                  hintText: "password",
                  icon: Icon(Icons.lock),
                ),
                onFieldSubmitted: (_) {
                  _pwdNode.unfocus();
                  _doValidate();
                },
              ),
              pad,
              Container(
                constraints: BoxConstraints(maxWidth: 250),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    FlatButton(
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                      onPressed: _doValidate,
                      child: Text("Continue"),
                    ),
                    pad,
                    Center(child: Text("- OR -")),
                    pad,
                    RaisedButton(
                      color: Colors.white,
                      textColor: Theme.of(context).accentColor,
                      onPressed: () {
                        formKey.currentState.reset();
                        authBloc.dispatch(widget.uniEvent);
                      },
                      child: Text("${widget.action} with university account"),
                    ),
                    pad,
                    FlatButton(
                      onPressed: () {
                        formKey.currentState.reset();
                        authBloc.dispatch(widget.switchEvent);
                      },
                      child: Text(
                        widget.altMessage,
                        style: TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

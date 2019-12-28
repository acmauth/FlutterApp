import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Router.dart';
import '../../bloc/auth/exports.dart';
import '../AbstractPage.dart';
import '../fragments/BlankPadding.dart';
import '../fragments/PasswordField.dart';
import '../fragments/StyledText.dart';

class AuthPage extends AbstractPage {
  const AuthPage({
    Key key,
    this.isLogIn = true,
  }) : super(
          key: key,
          appBarColorBg: Colors.lightBlue,
          appBarColorTxt: Colors.white,
          appBarTitle: isLogIn ? 'Log In' : 'Sign Up',
          hideBackArrow: true,
        );

  final bool isLogIn;

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends PageState<AuthPage> {
  final RegExp emailRegex = RegExp(
    r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  GlobalKey<ScaffoldState> _scfKey;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final GlobalKey<FormFieldState<dynamic>> _emailKey =
      GlobalKey<FormFieldState<dynamic>>();
  final GlobalKey<FormFieldState<dynamic>> _pwdKey =
      GlobalKey<FormFieldState<dynamic>>();
  final GlobalKey<FormFieldState<dynamic>> _pwdConfirmKey =
      GlobalKey<FormFieldState<dynamic>>();

  static String _email, _pwd, _pwdConfirm;
  final FocusNode _emailNode = FocusNode();
  final FocusNode _pwdNode = FocusNode();
  final FocusNode _pwdConfirmNode = FocusNode();

  final SnackBar error = SnackBar(
    content: const Text('Invalid Credentials!'),
    backgroundColor: Colors.redAccent,
  );

  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    _scfKey = scfKey;
    return Container(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              _buildLogo(),
              const BlankPadding(),
              _buildEmailField(),
              const BlankPadding(),
              _buildPasswordFields(),
              const BlankPadding(),
              Container(
                constraints: const BoxConstraints(maxWidth: 250),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _buildContinueButton(),
                    const BlankPadding(),
                    Center(child: const Text('- OR -')),
                    const BlankPadding(),
                    _buildSsoButton(),
                    const BlankPadding(),
                    _buildSwitchPageButton(),
                    if (widget.isLogIn)
                      FlatButton(
                        onPressed: () => BlocProvider.of<AuthBloc>(context)
                            .add(AuthSuccess()),
                        child: Text('Skip (dev only)'),
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

  String _doCheckEmail(String email) {
    return !emailRegex.hasMatch(email) ? 'Please enter a valid email!' : null;
  }

  String _doCheckPassword(String password) {
    return password.length < 5
        ? 'Please enter a password longer than 5 characters!'
        : null;
  }

  void _unfocus() {
    _emailNode.unfocus();
    _pwdNode.unfocus();
  }

  bool _doAuth() {
    // TODO(sakis): Implement authentication flow
    // TODO save data to disk
    if (widget.isLogIn) {
      return true;
    } else {
      return true;
    }
  }

  void _doValidate() {
    _unfocus();

    final FormState form = _formKey.currentState;
    form.save();
    if (form.validate()) {
      if (_doAuth()) {
        BlocProvider.of<AuthBloc>(context).add(AuthSuccess());
        if (!widget.isLogIn) {
          Router.push(context, "/form/personal");
        }
      } else {
        _scfKey.currentState.hideCurrentSnackBar();
        _scfKey.currentState.showSnackBar(error);
      }
    }
  }

  Row _buildLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          'assets/logo.png',
          width: 100,
        ),
        const BlankPadding(),
        StyledText(
          'Grade++',
          size: 24,
          weight: FontWeight.bold,
        ),
      ],
    );
  }

  TextFormField _buildEmailField() {
    return TextFormField(
      key: _emailKey,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onSaved: (String value) => _email = value,
      focusNode: _emailNode,
      validator: _doCheckEmail,
      decoration: InputDecoration(
        hintText: 'me@auth.gr',
        icon: Icon(Icons.email),
      ),
      onFieldSubmitted: (_) {
        if (_emailKey.currentState.validate()) {
          _pwdNode.requestFocus();
        }
      },
    );
  }

  Widget _buildPasswordFields() {
    return Column(
      children: <Widget>[
        PasswordField(
          key: _pwdKey,
          textInputAction:
              widget.isLogIn ? TextInputAction.done : TextInputAction.next,
          onSaved: (String value) => _pwd = value,
          focusNode: _pwdNode,
          validator: _doCheckPassword,
          hintText: 'password',
          onFieldSubmitted: () =>
              widget.isLogIn ? _doValidate() : _pwdConfirmNode.requestFocus(),
        ),
        if (!widget.isLogIn)
          Column(
            children: <Widget>[
              BlankPadding(),
              PasswordField(
                key: _pwdConfirmKey,
                textInputAction: TextInputAction.done,
                onSaved: (String value) => _pwdConfirm = value,
                focusNode: _pwdConfirmNode,
                validator: (String value) => _pwdConfirm != _pwd
                    ? "The passwords you entered don't match!"
                    : null,
                hintText: 'confirm password',
                onFieldSubmitted: _doValidate,
              ),
            ],
          ),
      ],
    );
  }

  FlatButton _buildContinueButton() {
    return FlatButton(
      color: Theme.of(context).accentColor,
      textColor: Colors.white,
      onPressed: () => _doValidate(),
      child: const Text('Continue'),
    );
  }

  RaisedButton _buildSsoButton() {
    return RaisedButton(
      color: Theme.of(context).backgroundColor,
      textColor: Theme.of(context).accentColor,
      onPressed: () {
        _formKey.currentState.reset();
        Router.push(context, '/sso');
      },
      child: Text('${widget.appBarTitle} with university account'),
    );
  }

  FlatButton _buildSwitchPageButton() {
    return FlatButton(
      onPressed: () {
        if (widget.isLogIn) {
          _formKey.currentState.reset();
          Router.push(context, '/signup');
        } else {
          Router.pop(context);
        }
      },
      child: Text(
        widget.isLogIn
            ? "Don't have an account? Sign Up!"
            : 'Already have an account? Log In!',
        style: TextStyle(
          color: Theme.of(context).accentColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

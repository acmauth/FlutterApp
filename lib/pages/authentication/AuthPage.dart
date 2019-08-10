import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_plus_plus/bloc/auth/exports.dart';
import 'package:grade_plus_plus/pages/fragments/exports.dart';
import 'package:grade_plus_plus/Router.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key key, this.isLogIn = true}) : super(key: key);

  final bool isLogIn;

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<ScaffoldState> _scfKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email, _pwd;
  final FocusNode _emailNode = FocusNode();
  final FocusNode _pwdNode = FocusNode();

  final SnackBar error = SnackBar(
    content: const Text('Invalid Credentials!'),
    backgroundColor: Colors.redAccent,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scfKey,
      appBar: AppBar(
        title: Text(widget.isLogIn ? 'Log In' : 'Sign Up'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              _buildLogo(),
              const BlankPadding(),
              _buildEmailField(),
              const BlankPadding(),
              _buildPasswordField(),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _unfocus() {
    _emailNode.unfocus();
    _pwdNode.unfocus();
  }

  bool _doAuth() {
    // TODO(dinos): Implement authentication flow
    if (widget.isLogIn) {
      return true;
    } else {
      return true;
    }
  }

  void _doValidate() {
    _unfocus();

    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      if (_doAuth()) {
        if (widget.isLogIn) {
          Router.replace(context, '/home');
        } else {
          Router.pop(context);
        }
        BlocProvider.of<AuthBloc>(context).dispatch(AuthSuccess());
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
        const Text(
          'Grade++',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  TextFormField _buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onSaved: (String value) => _email = value,
      focusNode: _emailNode,
      validator: (String value) =>
          value.length < 3 ? 'Please enter an email!' : null,
      decoration: InputDecoration(
        hintText: 'me@auth.gr',
        icon: Icon(Icons.email),
      ),
      onFieldSubmitted: (_) => _pwdNode.requestFocus(),
    );
  }

  TextFormField _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      onSaved: (String value) => _pwd = value,
      focusNode: _pwdNode,
      validator: (String value) => value.length < 5
          ? 'Please enter a password longer than 5 characters!'
          : null,
      decoration: InputDecoration(
        hintText: 'password',
        icon: Icon(Icons.lock),
      ),
      onFieldSubmitted: (_) => _doValidate(),
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
      child: Text(
          '${widget.isLogIn ? 'Log In' : 'Sign Up'} with university account'),
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

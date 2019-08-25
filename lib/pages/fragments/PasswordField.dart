import 'package:flutter/material.dart';

class PasswordField extends TextFormField {
  PasswordField({
    @required GlobalKey<FormFieldState<dynamic>> key,
    @required FocusNode focusNode,
    @required TextInputAction textInputAction,
    @required dynamic onSaved,
    @required dynamic validator,
    @required String hintText,
    @required dynamic onFieldSubmitted,
  }) : super(
          key: key,
          obscureText: true,
          keyboardType: TextInputType.text,
          textInputAction: textInputAction,
          onSaved: (String value) => onSaved(value),
          focusNode: focusNode,
          validator: (String value) => validator(value),
          decoration: InputDecoration(
            hintText: hintText,
            icon: Icon(Icons.lock),
          ),
          onFieldSubmitted: (_) {
            final FormFieldState<dynamic> state = key.currentState;
            state.save();
            if (state.validate()) {
              onFieldSubmitted();
            }
          },
        );
}

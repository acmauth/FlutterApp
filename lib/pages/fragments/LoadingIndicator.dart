import 'package:flutter/material.dart';

class LoadingIndicator extends CircularProgressIndicator {
  LoadingIndicator()
      : super(
          backgroundColor: Colors.blue.withOpacity(0.1),
          strokeWidth: 5,
        );
}

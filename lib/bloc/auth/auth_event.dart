import 'package:meta/meta.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthEvent {}

class AuthSuccess extends AuthEvent {}

class LogOut extends AuthEvent {}

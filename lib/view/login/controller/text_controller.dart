import 'package:flutter/material.dart';

class TextController {
  TextController._();
  static final instance = TextController._();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;
}

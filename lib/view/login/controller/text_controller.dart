import 'package:flutter/material.dart';

class TextController {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;
}

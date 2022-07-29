import 'package:flutter/material.dart';

class TextController {
  TextController._();
  static final instance = TextController._();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
}

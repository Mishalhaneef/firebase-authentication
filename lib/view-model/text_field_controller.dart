import 'package:flutter/material.dart';

class TextFieldController extends ChangeNotifier {
  bool obscureText = false;

  toggleShowPassword() {
    obscureText = !obscureText;
    notifyListeners();
  }
}

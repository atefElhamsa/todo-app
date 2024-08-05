import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool switchValue = false;
  changeSwitchValue(bool value) {
    switchValue = value;
    notifyListeners();
  }
}

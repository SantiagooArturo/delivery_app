import 'package:flutter/material.dart';

class ChangeTheme with ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  set changeTheme(bool value) {
    _isDark = value;
    notifyListeners();
  }
}
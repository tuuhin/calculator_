import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _thememode = ThemeMode.system;

  get themeMode => _thememode;

  bool get themeisDark => _thememode == ThemeMode.dark;

  void changeTheme(bool switchValue) {
    _thememode = switchValue ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

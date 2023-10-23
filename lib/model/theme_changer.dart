import 'package:bankboard/model/darktheme_sharedpreferences.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();

  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }

  // ThemeMode _themeMode = ThemeMode.system;

  // ThemeMode get themeMode => _themeMode;

  // void setThemeMode(ThemeMode themeMode) {
  //   _themeMode = themeMode;
  //   notifyListeners();
  // }
}

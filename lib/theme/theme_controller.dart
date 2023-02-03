import 'package:flutter/material.dart';

//to manage the app theme
class ThemeController with ChangeNotifier {
  
  ThemeMode _themeMode = ThemeMode.light; 
  get themeMode => _themeMode;
  //
  toggleTheme({required bool isDark}) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;  
    notifyListeners(); 
  }

}
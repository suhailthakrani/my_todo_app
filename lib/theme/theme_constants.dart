import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  textTheme: TextTheme(
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w700,
      color: Colors.indigo.shade900,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: Colors.white,
  ),

  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ButtonStyle(
  //     shape: MaterialStateProperty.all<OutlinedBorder>(
  //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
  //     backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
  //   ),
  // ),
  // bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //   selectedItemColor: Colors.white,
  //   unselectedItemColor: Colors.white,
  // ),
);

//
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: Colors.white,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.green.shade500,
    foregroundColor: Colors.indigo.shade900,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,
  ),
);

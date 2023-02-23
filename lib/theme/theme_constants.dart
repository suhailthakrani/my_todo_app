import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  primaryColor: Colors.indigo.shade800,

 
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 20,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    // filled: true,
    // fillColor: Colors.white,
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
  cardTheme: const CardTheme(color: Colors.black54),
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
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
 
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 20,
    ),
  ),
);

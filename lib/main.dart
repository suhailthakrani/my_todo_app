import 'package:flutter/material.dart';
import 'package:my_todo_app/home_screen.dart';
import 'package:my_todo_app/theme/theme_constants.dart';
import 'package:my_todo_app/theme/theme_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}


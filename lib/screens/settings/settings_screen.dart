// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:my_todo_app/home_screen.dart';
import 'package:my_todo_app/theme/theme_constants.dart';
import 'package:my_todo_app/theme/theme_controller.dart';

class SettingsScreen extends StatefulWidget {
  // final ValueSetter themeChanger;
  const SettingsScreen({
    Key? key,
    // required this.themeChanger,
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

// ThemeController themeController = ThemeController();

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    // theme: lightTheme,
    // darkTheme: darkTheme,
    // themeMode: themeController.themeMode,

    return Scaffold(
      body: Center(
        child: Switch(
          value: themeController.themeMode == ThemeMode.dark,
          onChanged: (value) {
            print(themeController.themeMode == ThemeMode.dark);
            themeController.toggleTheme(isDark: value);

            // setState(() {

            //   // isDarkTheme = value;
            // });
          },
        ),
      ),
    );
  }
}

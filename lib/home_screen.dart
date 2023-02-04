import 'package:flutter/material.dart';
import 'package:my_todo_app/screens/notes/components/add_note.dart';
import 'package:my_todo_app/screens/notes/notes_screen.dart';
import 'package:my_todo_app/screens/settings/settings_screen.dart';
import 'package:my_todo_app/screens/todo/todo_screen.dart';
import 'package:my_todo_app/theme/theme_constants.dart';
import 'package:my_todo_app/theme/theme_controller.dart';

ThemeController themeController = ThemeController();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkTheme = false;

  @override
  void initState() {
    themeController.addListener(themeRefresher);
    super.initState();
  }

  @override
  void dispose() {
    themeController.removeListener(themeRefresher);
    super.dispose();
  }

  themeRefresher() {
    if (mounted) {
      setState(() {});
    }
  }

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    NotesScreen(),
    ToDoScreen(),
    // SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeController.themeMode,
      home: Scaffold(
        appBar: _selectedIndex == 0
            ? AppBar(
                title: Text(
                  "Hi, Suhail Thakrani",
                  style: textTheme.displayMedium!.copyWith(
                    color: Colors.indigo.shade800,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                actions: [
                  Switch(
                    value: themeController.themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      print(themeController.themeMode == ThemeMode.dark);
                      themeController.toggleTheme(isDark: value);
                    },
                  ),
                  SizedBox(width: 12),
                ],
              )
            : PreferredSize(
                child: Container(),
                preferredSize: Size.fromHeight(30),
              ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor:
                Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            unselectedItemColor:
                Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
            currentIndex: _selectedIndex,
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Notes',
                icon: Icon(
                  Icons.list,
                ),
              ),
              BottomNavigationBarItem(
                label: 'To-dos',
                icon: Icon(
                  Icons.task_alt_outlined,
                ),
              ),
              // BottomNavigationBarItem(
              //   label: 'Settings',
              //   icon: Icon(
              //     Icons.settings,
              //   ),
              // ),
            ]),
      ),
    );
  }
}



/*
ListView(
          padding: EdgeInsets.all(16),
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              "Hello World!",
              style: textTheme.headlineLarge,
            ),
            SizedBox(height: 10),
            Text(
              "Hello World!",
              style: textTheme.headlineMedium,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "Type here...",
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isDarkTheme = true;
                });
                _themeController.toggleTheme(isDark: isDarkTheme);
              },
              child: Text("Dark Mode"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isDarkTheme = false;
                });
                _themeController.toggleTheme(isDark: isDarkTheme);
              },
              child: Text("Light Mode"),
            )
          ],
        ),
        */

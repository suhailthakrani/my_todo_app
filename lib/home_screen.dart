import 'package:flutter/material.dart';
import 'package:my_todo_app/screens/notes/components/add_note.dart';
import 'package:my_todo_app/screens/notes/notes_screen.dart';
import 'package:my_todo_app/screens/todo/todo_screen.dart';
import 'package:my_todo_app/theme/theme_constants.dart';
import 'package:my_todo_app/theme/theme_controller.dart';

ThemeController _themeController = ThemeController();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkTheme = false;

  int _selectedIndex = 0;
   

  final List<Widget> _screens = [
    NotesScreen(),
    ToDoScreen(),
  ];
  @override
  void dispose() {
    _themeController.removeListener(() {
      themeListener();
    });
    super.dispose();
  }

  @override
  void initState() {
    _themeController.addListener(() {
      themeListener();
    });
    super.initState();
  }

  //
  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeController.themeMode,
      home: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            items: [
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_todo_app/models/notes_model.dart';
import 'package:my_todo_app/screens/notes/components/add_note.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Note> notes = [];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi, Suhail Thakrani",
                    style: textTheme.headlineSmall,
                  ),
                  Icon(
                    CupertinoIcons.person_alt_circle,
                  )
                ],
              ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Notes',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,
                        color: Color.fromARGB(255, 181, 206, 226),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notes[index].title,
                                style: textTheme.bodyLarge,
                                softWrap: true,
                              ),
                              Text(
                                notes[index].description,
                                style: textTheme.bodyMedium,
                                softWrap: true,
                              ),
                              Text(
                                notes[index].time,
                                style: textTheme.bodySmall,
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNote(
                    noteSetter: (value) {
                      setState(() {
                        notes.add(value);
                      });
                    },
                  ),
                ));
          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}

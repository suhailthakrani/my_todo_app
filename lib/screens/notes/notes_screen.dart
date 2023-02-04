import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_todo_app/db/database_provider.dart';
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
            // GreetingHeader(textTheme: textTheme),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 16),
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
                  child: FutureBuilder(
                    future: DatabaseProvider.db.getNotes(),
                    builder: (context, noteData) {
                      switch (noteData.connectionState) {
                        case ConnectionState.waiting:
                          {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                        case ConnectionState.done:
                          {
                            if (noteData.hasError) {
                              return const Text("Ups! Something went wrong...");
                            }
                            if (noteData.data == null) {
                              return const Center(
                                child:
                                    Text("You have not created any note yet!"),
                              );
                            } else {
                              return ListView.builder(
                                itemCount: noteData.data.length,
                                itemBuilder: (context, index) {
                                  Note note =
                                      Note.fromMap(noteData.data[index]);

                                  return Card(
                                    elevation: 3,
                                    color: Color.fromARGB(255, 181, 206, 226),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            note.title,
                                            style: textTheme.bodyLarge,
                                            softWrap: true,
                                          ),
                                          Text(
                                            note.body,
                                            style: textTheme.bodyMedium,
                                            softWrap: true,
                                          ),
                                          Text(
                                            note.creationDateTime.toString(),
                                            style: textTheme.bodySmall,
                                            softWrap: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          }
                        default:
                          return const Text("Ups! Something went wrong.");
                      }
                    },
                  )),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          // backgroundColor:

          //     Theme.of(context).floatingActionButtonTheme.backgroundColor,
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

class GreetingHeader extends StatelessWidget {
  const GreetingHeader({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_todo_app/db/database_provider.dart';

import 'package:my_todo_app/models/notes_model.dart';

class AddNote extends StatefulWidget {
  // final ValueSetter<Note> noteSetter;

  const AddNote({
    Key? key,
    // required this.noteSetter,
  }) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool editingStarted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.indigo.shade600,
          ),
        ),
        title: Text(
          'Add New Note',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.indigo.shade800,
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16),
            child: Text(
              '${DateTime.now().hour}: ${DateTime.now().minute.abs()}',
            ),
          ),
          preferredSize: Size.fromHeight(
            30,
          ),
        ),
        actions: [
          editingStarted
              ? InkWell(
                  onTap: () async {
                    await DatabaseProvider.db.addNewNote(Note.fromMap({
                      'title': _titleController.text,
                      'body': _descriptionController.text,
                      'creationDateTime': DateTime.now()
                    }));
                    if (mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Icon(
                    Icons.done,
                    color: Colors.indigo.shade800,
                    size: 30,
                  ),
                )
              : Container(),
          SizedBox(width: 24),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32,
        ),
        child: Column(
          children: [
            TextField(
              onEditingComplete: () {
                setState(() {
                  editingStarted = true;
                });
              },
              controller: _titleController,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.indigo.shade800,
              ),
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    editingStarted = true;
                  });
                },
                controller: _descriptionController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Note something down',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

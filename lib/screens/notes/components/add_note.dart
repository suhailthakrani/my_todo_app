// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:my_todo_app/models/notes_model.dart';

class AddNote extends StatefulWidget {
  final ValueSetter<Note> noteSetter;

  const AddNote({
    Key? key,
    required this.noteSetter,
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
        title: Text('Notes'),
        bottom: PreferredSize(
          child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16),
              child: Text(
                  '${DateTime.now().hour}: ${DateTime.now().minute.abs()}')),
          preferredSize: Size.fromHeight(
            30,
          ),
        ),
        actions: [
          editingStarted
              ? InkWell(
                  onTap: () {
                    widget.noteSetter(Note.fromMap({
                      'title': _titleController.text,
                      'body': _descriptionController.text,
                      'creationDateTime':DateTime.now()
                        
                    }));
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.done))
              : Container(),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32,
        ),
        children: [
          TextField(
            onEditingComplete: () {
              setState(() {
                editingStarted = true;
              });
            },
            controller: _titleController,
            decoration: InputDecoration(
              hintText: 'Title',
              hintStyle: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          TextField(
            // onChanged: (value) {
            //   setState(() {
            //     editingStarted = true;
            //   });
            // },
            controller: _descriptionController,
            // maxLines: 10,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: 'Note something down',
              hintStyle: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

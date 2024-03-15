import 'package:flutter/material.dart';
import 'package:notes_app/edit_notes.dart';
import 'package:notes_app/models/model.dart';

class ViewScreen extends StatelessWidget {
  final String title;
  final String content;
  final void Function(int, Note) onNoteUpdated;
  final void Function(int) onNoteDeleted;
  final int index;
  const ViewScreen(
      {super.key,
      required this.onNoteDeleted,
      required this.index,
      required this.title,
      required this.content,
      required this.onNoteUpdated});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('View Notes'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Are you sure you want to delete ?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            onNoteDeleted(index);
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: const Text('Delete')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'))
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return EditNotesScreen(
              onNoteUpdated: onNoteUpdated,
              index: index,
              title: title,
              content: content,
            );
          }));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.teal,
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  Text(content, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

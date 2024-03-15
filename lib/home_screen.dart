import 'package:flutter/material.dart';
import 'package:notes_app/add_notes.dart';
import 'package:notes_app/models/model.dart';
import 'package:notes_app/view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Notes App'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return  ViewScreen(onNoteUpdated:onNoteUpdated, index: index, title: notes[index].title, content: notes[index].content, onNoteDeleted: onNoteDeleted,);
              }));
            },
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  Padding(
                  padding:const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notes[index].title, style:const TextStyle(fontSize: 20)),
                     const SizedBox(height: 10),
                      Text(notes[index].content, style:const TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return  AddNotesScreen(onNoteCreated:onNoteCreated,);
          }));
        },
        backgroundColor: Colors.pink,
        child: const Icon(Icons.add),
      ),
    );
  }

  void onNoteCreated(Note note) {
    notes.add(note);
    setState(() {});
  }

  void onNoteDeleted(int index) {
    notes.removeAt(index);
    setState(() {});
  }

  void onNoteUpdated(int index,Note note) {
    notes[index] = note;
    setState(() {});
  }
}

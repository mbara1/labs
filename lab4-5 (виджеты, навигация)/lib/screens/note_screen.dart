import 'package:flutter/material.dart';

import '../models/note_model.dart';
import '../models/note_storage_model.dart';
import 'note_list_screen.dart';

class NoteScreen extends StatelessWidget {
  List<Note> notes;
  Note note;

  final TextEditingController _controller = TextEditingController();

  NoteScreen(this.notes, this.note) {
    _controller.text = note.content ?? '';
  }

  final noteStorage = NoteStorage();

  Future<void> _updateNote() async {
    await noteStorage.updateNotes(notes, note);
  }

  Future<void> _deleteNote() async {
    await noteStorage.removeNote(notes, note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              note.content = _controller.text;
              _updateNote();

              Navigator.popUntil(context, (route) {
                if (route.isFirst) {
                  homePageKey.currentState?.updatePage();
                  return true;
                }
                return false;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _deleteNote();

              Navigator.popUntil(context, (route) {
                if (route.isFirst) {
                  homePageKey.currentState?.updatePage();
                  return true;
                }
                return false;
              });
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Date: ${note.date}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: 'Enter your note here...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

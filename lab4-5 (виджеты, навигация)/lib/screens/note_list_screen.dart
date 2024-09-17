import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/note_model.dart';
import '../models/note_storage_model.dart';
import 'note_screen.dart';

final GlobalKey<_NoteListState> homePageKey = GlobalKey<_NoteListState>();

class NoteList extends StatefulWidget {
  NoteList({Key? key}) : super(key: homePageKey);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  final noteStorage = NoteStorage();
  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  void updatePage() {
    setState(() {
      _loadNotes();
    });
  }

  Future<void> _loadNotes() async {
    final loadedNotes = await noteStorage.readNotes();
    setState(() {
      notes = loadedNotes;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notes[index].title),
            subtitle: Text(notes[index].content ?? ''),
            trailing: Text(notes[index].date),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NoteScreen(notes, notes[index])),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String newNoteTitle = '';
              return AlertDialog(
                title: const Text('Add Note'),
                content: TextField(
                  onChanged: (value) {
                    newNoteTitle = value;
                  },
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NoteScreen(notes, Note(title: newNoteTitle))),
                      );

                      // Navigator.pop(context);
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        mini: true,
        child: const Icon(Icons.add),
      ),
    );
  }
}

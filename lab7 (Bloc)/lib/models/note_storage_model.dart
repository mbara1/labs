import 'dart:convert';
import 'dart:io';
import 'package:labs/models/note_model.dart';
import 'package:path_provider/path_provider.dart';

class NoteStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/notes.json');
  }

  Future<List<Note>> readNotes() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      final List<dynamic> jsonData = json.decode(contents);
      return jsonData.map((json) => Note.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> removeNote(List<Note> notes, Note currNote) async {
    notes.removeWhere((note) => note.title == currNote.title);
    await writeNotes(notes);
  }

  Future<void> updateNote(List<Note> notes, Note currNote) async {
    for (var note in notes) {
      if (note.title == currNote.title && note.date == currNote.date) {
        note.content = currNote.content;
      }
    }

    await writeNotes(notes);
  }

  Future<void> addNote(List<Note> notes, Note newNote) async {
    notes.add(newNote);
    await writeNotes(notes);
  }

  Future<File> writeNotes(List<Note> notes) async {
    final file = await _localFile;
    final String jsonString =
        json.encode(notes.map((note) => note.toJson()).toList());
    return file.writeAsString(jsonString);
  }
}

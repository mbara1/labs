import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/note_model.dart';

class FirebaseManager {
  final CollectionReference notesCollection = FirebaseFirestore.instance.collection('mbnotes');

  Future<List<Note>> getNotes() async {
    QuerySnapshot snapshot = await notesCollection.get();
    return snapshot.docs.map((doc) => Note.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }

  Future<void> addNote({
    required String id,
    required String title,
    String? content,
  }) async {
    Note newNote = Note(
      id: id,
      title: title,
      content: content,
    );
    await notesCollection.doc(id).set(newNote.toJson());
  }

  Future<void> updateNote({
    required String id,
    required String title,
    String? content,
  }) async {
    Note updatedNote = Note(
      id: id,
      title: title,
      content: content,
    );
    await notesCollection.doc(id).update(updatedNote.toJson());
  }

  Future<void> deleteNote({
    required String id,
  }) async {
    await notesCollection.doc(id).delete();
  }
}

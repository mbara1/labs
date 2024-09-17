import 'package:flutter/material.dart';
import 'package:labs/screens/note_list_screen.dart';


Future<void> main() async {
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NoteList(),
    );
  }
}

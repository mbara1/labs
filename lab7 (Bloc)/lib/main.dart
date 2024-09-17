import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labs/bloc/note_bloc.dart';
import 'package:labs/screens/note_list_screen.dart';

Future<void> main() async {
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => NoteBloc(),
        child: MaterialApp(
          home: NoteList(),
        ),
      ),
    );
  }
}

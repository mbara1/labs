import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/note_bloc.dart';
import '../bloc/note_event.dart';
import '../bloc/note_state.dart';
import '../models/note_model.dart';
import 'note_screen.dart';

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<NoteBloc, NoteState>(
                builder: (context, state) {
                  if (state is InitialState) {
                    BlocProvider.of<NoteBloc>(context).add(LoadEvent());
                    return const Text('');
                  } else if (state is LoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is LoadedState) {
                    return ListView.builder(
                      itemCount: state.notes.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.notes[index].title),
                          subtitle: Text(state.notes[index].content ?? ''),
                          trailing: Text(state.notes[index].date),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NoteScreen(state.notes[index])),
                            );
                          },
                        );
                      },
                    );
                  } else {
                    return const Text('Something went wrong!');
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext alertContext) {
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
                      if (newNoteTitle.isNotEmpty) {
                        var newNote = Note(
                          title: newNoteTitle,
                        );

                        BlocProvider.of<NoteBloc>(context).add(AddEvent(newNote));

                        Navigator.pop(alertContext);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NoteScreen(newNote)),
                        );
                      }
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

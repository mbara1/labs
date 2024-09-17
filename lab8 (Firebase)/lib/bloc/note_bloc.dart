import 'package:bloc/bloc.dart';
import 'package:labs/bloc/note_state.dart';
import '../manager/frebase_manager.dart';
import '../models/note_model.dart';
import 'note_event.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(InitialState()) {
    on<LoadEvent>(_onLoadEvent);
    on<AddEvent>(_onAddEvent);
    on<UpdateEvent>(_onUpdateEvent);
    on<DeleteEvent>(_onDeleteEvent);
  }

  final firebaseManager = FirebaseManager();

  Future<void> _onLoadEvent(LoadEvent event, Emitter<NoteState> emit) async {
    emit(LoadingState());
    List<Note> loadedNotes = await firebaseManager.getNotes();

    emit(LoadedState(loadedNotes));
  }

  Future<void> _onAddEvent(AddEvent event, Emitter<NoteState> emit) async {
    await firebaseManager.addNote(
      id: event.newNote.id,
      title: event.newNote.title,
      content: event.newNote.content,
    );
  }

  Future<void> _onUpdateEvent(UpdateEvent event, Emitter<NoteState> emit) async {
    await firebaseManager.updateNote(
      id: event.currNote.id,
      title: event.currNote.title,
      content: event.currNote.content,
    );
  }

  Future<void> _onDeleteEvent(DeleteEvent event, Emitter<NoteState> emit) async {
    await firebaseManager.deleteNote(
      id: event.id,
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:labs/bloc/note_state.dart';
import '../models/note_storage_model.dart';
import 'note_event.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(InitialState()) {
    on<LoadEvent>(_onLoadEvent);
    on<AddEvent>(_onAddEvent);
    on<UpdateEvent>(_onUpdateEvent);
    on<DeleteEvent>(_onDeleteEvent);
  }

  final noteStorage = NoteStorage();

  Future<void> _onLoadEvent(LoadEvent event, Emitter<NoteState> emit) async {
    emit(LoadingState());
    final loadedNotes = await noteStorage.readNotes();
    emit(LoadedState(loadedNotes));
  }

  Future<void> _onAddEvent(AddEvent event, Emitter<NoteState> emit) async {
    final loadedNotes = await noteStorage.readNotes();
    await noteStorage.addNote(loadedNotes, event.newNote);
    emit(LoadedState(loadedNotes));
  }

  Future<void> _onUpdateEvent(UpdateEvent event, Emitter<NoteState> emit) async {
    final loadedNotes = await noteStorage.readNotes();
    await noteStorage.updateNote(loadedNotes, event.currNote);
    emit(LoadedState(loadedNotes));
  }

  Future<void> _onDeleteEvent(DeleteEvent event, Emitter<NoteState> emit) async {
    final loadedNotes = await noteStorage.readNotes();
    await noteStorage.removeNote(loadedNotes, event.currNote);
    emit(LoadedState(loadedNotes));
  }
}

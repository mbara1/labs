import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../models/note_model.dart';

@immutable
abstract class NoteState extends Equatable {
  NoteState([List props = const []]);
}

class InitialState extends NoteState {
  @override
  List<Object> get props => [];
}

class LoadingState extends NoteState {
  @override
  List<Object> get props => [];
}

class LoadedState extends NoteState {
  final List<Note> notes;

  LoadedState(this.notes) : super([notes]);

  @override
  List<Object> get props => [notes];
}

class AddState extends NoteState {
  @override
  List<Object> get props => [];
}

class UpdateState extends NoteState {
  @override
  List<Object> get props => [];
}

class DeleteState extends NoteState {
  @override
  List<Object> get props => [];
}

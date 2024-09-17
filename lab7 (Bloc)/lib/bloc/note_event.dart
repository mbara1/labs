import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../models/note_model.dart';

@immutable
abstract class NoteEvent extends Equatable {
  NoteEvent([List props = const []]);
}

class LoadEvent extends NoteEvent {
  @override
  List<Object> get props => [];
}

class AddEvent extends NoteEvent {
  final Note newNote;

  AddEvent(this.newNote) : super([newNote]);

  @override
  List<Object> get props => [newNote];
}

class UpdateEvent extends NoteEvent {
  final Note currNote;

  UpdateEvent(this.currNote) : super([currNote]);

  @override
  List<Object> get props => [currNote];
}

class DeleteEvent extends NoteEvent {
  final Note currNote;

  DeleteEvent(this.currNote) : super([currNote]);

  @override
  List<Object> get props => [currNote];
}

import 'package:flutter/foundation.dart' show immutable;
import 'package:zax/dummy/dummy_notes.dart';
import 'package:zax/models/login_handle.dart';
import 'package:zax/models/note_handle.dart';

@immutable
abstract class NotesAPIProtocol {
  const NotesAPIProtocol();
  Future<Iterable<Notes>?> noteLoader({
    required LoginHandler loginHandler,
  });
}

class NoteAPI implements NotesAPIProtocol {
  //* a software design pattern that restricts the instantiation of a class to one "single" instance.
  //* override default constructor with this constructor to prevent it to initialized
  const NoteAPI._onlyInstance();
  static const NoteAPI _shared = NoteAPI._onlyInstance();
  factory NoteAPI.instance() => _shared;

  @override
  Future<Iterable<Notes>?> noteLoader({
    required LoginHandler loginHandler,
  }) =>
      Future.delayed(
        const Duration(seconds: 1),
        () => loginHandler == const LoginHandler.test(),
      ).then(
        (testLogin) => testLogin ? dummyNotes : null,
      );
}

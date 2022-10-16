import 'package:flutter/foundation.dart' show immutable;
import 'package:zax/dummy/dummy_notes.dart';
import 'package:zax/model/note_handle.dart';

@immutable
abstract class NotesAPIProtocol {
  const NotesAPIProtocol();
  Future<Iterable<Notes>?> noteLoader({
    required loginHandler,
  });
}

class NoteAPI implements NotesAPIProtocol {
  const NoteAPI._onlyInstance();
  static const NoteAPI _shared = NoteAPI._onlyInstance();
  factory NoteAPI.instance() => _shared;
  @override
  Future<Iterable<Notes>?> noteLoader({
    required loginHandler,
  }) =>
      Future.delayed(
        const Duration(seconds: 1),
        () => loginHandler == loginHandler.test,
      ).then(
        (testLogin) => testLogin ? dummyNotes : null,
      );
}

// class Test implements NoteAPI {
//   @override
//   Future<Iterable<Notes>?> noteLoader({required loginHandler}) {
//     throw UnimplementedError();
//   }
// }

// class Test2 extends NoteAPI {
//   Test2() : super._onlyInstance();
// }

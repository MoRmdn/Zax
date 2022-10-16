import 'package:zax/model/note_handle.dart';

//* generate Iterable with certain number (index)
final dummyNotes = Iterable.generate(
  4,
  (index) => Notes(
    title: 'Notes $index',
    description: 'This is description of Notes $index',
  ),
);

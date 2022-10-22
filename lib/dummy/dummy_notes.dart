import 'package:zax/models/note_handle.dart';

//* generate Iterable with certain number (index)
final dummyTestNotes = Iterable.generate(
  4,
  (index) => Notes(
    title: 'Test Notes $index',
    description: 'This is description of Notes $index',
  ),
);

final dummyNotes = Iterable.generate(
  4,
  (index) => Notes(
    title: 'Notes $index',
    description: 'This is description of test Notes $index',
  ),
);

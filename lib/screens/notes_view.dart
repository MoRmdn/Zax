import 'package:flutter/material.dart';
import 'package:zax/helper/app_config.dart';
import 'package:zax/models/note_handle.dart';

class NotesView extends StatelessWidget {
  final Iterable<Notes> notes;
  const NotesView({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConfig.appTitle)),
      body: notes.toListView(),
    );
  }
}

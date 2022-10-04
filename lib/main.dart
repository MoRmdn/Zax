import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc_provider.dart';
import 'home.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Zax',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: BlocProvider(
        create: (_) => PersonsBloc(),
        child: const HomePage(),
      ),
    ),
  );
}

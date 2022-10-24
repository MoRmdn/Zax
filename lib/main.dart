import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zax/bloc/app_bloc.dart';
import 'package:zax/helper/app_config.dart';
import 'package:zax/screens/home.dart';

import 'api/login_api.dart';
import 'api/notes_api.dart';

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            create: (_) => AppBloc(
              loginApi: LoginAPI.instance(),
              notesApi: NoteAPI.instance(),
            ),
          ),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: AppConfig.primaryColor,
            ),
      ),
      home: const MyHomePage(),
    );
  }
}

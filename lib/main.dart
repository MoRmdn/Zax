import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zax/screens/home_page.dart';

import 'helper/app_config.dart';

void main() => runApp(
      MultiBlocProvider(
        providers: const [],
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

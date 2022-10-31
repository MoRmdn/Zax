import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zax/screens/home_page.dart';

import 'bloc/bottom_bloc.dart';
import 'bloc/top_bloc.dart';
import 'helper/app_config.dart';

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<TopBloc>(
            create: (_) => TopBloc(
              waitBeforeLoading: const Duration(seconds: 3),
              urls: AppConfig.images,
            ),
          ),
          BlocProvider<BottomBloc>(
            create: (_) => BottomBloc(
              waitBeforeLoading: const Duration(seconds: 3),
              urls: AppConfig.images,
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
      home: const HomePage(),
    );
  }
}

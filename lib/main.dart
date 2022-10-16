import 'package:flutter/material.dart';
import 'package:zax/helper/app_config.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            AppConfig.appTitle,
          ),
        ),
      ),
    );
  }
}

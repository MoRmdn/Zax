import 'package:flutter/material.dart';
import 'package:zax/helper/app_config.dart' show AppConfig;
import 'package:zax/screens/login.dart';

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
      home: const LoginScreen(),
    );
  }
}

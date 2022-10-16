import 'package:flutter/material.dart';
import 'package:zax/dummy/dummy_notes.dart';
import 'package:zax/helper/app_config.dart';
import 'package:zax/model/login_handle.dart';

import 'bloc/app_state.dart';

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
            ConstStrings.appTitle,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final test = AppState(
                    isLoading: true,
                    loginError: LoginErrorHandler.invalidData,
                    loginHandle: const LoginHandler.test(),
                    notes: dummyNotes,
                  );
                  print(test);
                },
                child: const Text('Test Button'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

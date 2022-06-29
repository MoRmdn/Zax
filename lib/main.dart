import 'dart:math' as math show Random;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zax',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(),
    );
  }
}

const names = ["mohamed", "ali", "sa3d", "said", "mai", "mah"];

//* add this method to Iterable Class
extension GetRandomValue<T> on Iterable<T> {
  T getRandomValue() => elementAt(math.Random().nextInt(length));
}

class CubitNames extends Cubit<String?> {
  CubitNames() : super(null);

  void getName() {
    emit(names.getRandomValue());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CubitNames cubit = CubitNames();

  // @override
  // void initState() {
  //   super.initState();
  //   cubit = CubitNames();
  // }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Zax")),
      body: StreamBuilder(
          stream: cubit.stream,
          builder: (context, snapshot) {
            final button = TextButton(
              onPressed: () => cubit.getName(),
              child: const Text(
                "Pick a random name",
              ),
            );

            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(child: button);
              case ConnectionState.waiting:
                return Center(child: button);
              case ConnectionState.active:
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data as String? ?? ""),
                    button,
                  ],
                ));
              case ConnectionState.done:
                return const SizedBox();
            }
          }),
    );
  }
}

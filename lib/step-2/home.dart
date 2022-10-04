import 'package:flutter/material.dart';

import 'bloc/bloc_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CubitNames cubit = CubitNames();

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

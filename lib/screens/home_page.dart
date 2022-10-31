import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;

import '../bloc/bottom_bloc.dart';
import '../bloc/top_bloc.dart';
import 'app_bloc_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        //? to make Notification Bar Dark
        value: SystemUiOverlayStyle.dark,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: const [
            AppBlocView<TopBloc>(),
            AppBlocView<BottomBloc>(),
          ],
        ),
      ),
    );
  }
}

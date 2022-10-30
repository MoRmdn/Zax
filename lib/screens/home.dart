import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zax/bloc/app_action.dart';
import 'package:zax/bloc/app_bloc.dart';
import 'package:zax/bloc/app_state.dart';
import 'package:zax/dialog/custom_generic_dialog.dart';
import 'package:zax/dialog/loading_screen_dialog.dart';
import 'package:zax/helper/app_config.dart';
import 'package:zax/models/login_handle.dart';
import 'package:zax/screens/login.dart';
import 'package:zax/screens/notes_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final loading = LoadingScreen.instance();
    return Scaffold(
      body: BlocConsumer<AppBloc, AppState>(
        listener: (context, state) {
          //? loading
          if (state.isLoading) {
            loading.show(context: context, content: AppConfig.pleaseWait);
          } else {
            loading.hide();
          }
          final loginError = state.loginError;
          if (loginError != null) {
            customGenericDialog<bool>(
              context: context,
              title: AppConfig.loginErrorDialogTitle,
              content: AppConfig.loginErrorDialogContent,
              dialogOptions: () {
                return {
                  AppConfig.ok: true,
                };
              },
            );
          }

          if (state.isLoading == false &&
              state.loginError == null &&
              state.loginHandle == const LoginHandler.test() &&
              state.fetchedNotes == null) {
            context.read<AppBloc>().add(const LoadNotesAction());
          }
        },
        builder: (context, appState) {
          final fetchedNotes = appState.fetchedNotes;
          if (fetchedNotes == null) {
            return LoginScreen(
              onLoggingIn: (email, password) => context.read<AppBloc>().add(
                    LoginAction(
                      email: email,
                      password: password,
                    ),
                  ),
            );
          } else {
            return NotesView(notes: fetchedNotes);
          }
        },
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:zax/api/login_api.dart';
import 'package:zax/api/notes_api.dart';
import 'package:zax/bloc/app_action.dart';
import 'package:zax/bloc/app_state.dart';
import 'package:zax/helper/app_config.dart';
import 'package:zax/models/login_handle.dart';

class AppBloc extends Bloc<AppActions, AppState> {
  final LoginAPIProtocol loginApi;
  final NotesAPIProtocol notesApi;
  final LoginHandler acceptedLoginHandle;

  AppBloc({
    required this.acceptedLoginHandle,
    required this.loginApi,
    required this.notesApi,
  }) : super(
          const AppState.empty(),
        ) {
    const tUser = LoginHandler.test();

    //? first app action
    on<LoginAction>((event, emit) async {
      //* Start Loading Action
      emit(
        const AppState(
          isLoading: true,
          loginError: null,
          loginHandle: null,
          fetchedNotes: null,
        ),
      );
      //* logging user in
      final tLogin = await loginApi.testLogin(
        email: event.email,
        password: event.password,
      );

      emit(
        AppState(
          isLoading: false,
          //? why this is error could be any user
          loginError: tLogin == null ? LoginErrorHandler.invalidData : null,
          loginHandle: tLogin,
          fetchedNotes: null,
        ),
      );
    });

    //? second Action in app
    on<LoadNotesAction>((event, emit) async {
      //* Start Loading Action
      emit(
        AppState(
          isLoading: true,
          loginError: null,
          loginHandle: state.loginHandle,
          fetchedNotes: null,
        ),
      );
      //? check if loginHandle == LoginHandler.test() .... if true load notes
      //* this is the state of the action before (loginAction) i should save it to prevent it from overwrite
      final loginHandle = state.loginHandle;
      if (loginHandle != tUser) {
        emit(
          AppState(
            isLoading: false,
            loginError: LoginErrorHandler.invalidData,
            loginHandle: loginHandle,
            fetchedNotes: null,
          ),
        );
        return;
      }
      final notes = await notesApi.noteLoader(loginHandler: loginHandle!);
      emit(
        AppState(
          isLoading: false,
          loginError: null,
          loginHandle: loginHandle,
          fetchedNotes: notes,
        ),
      );
    });
  }
}

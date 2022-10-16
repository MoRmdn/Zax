import 'package:bloc/bloc.dart';
import 'package:zax/api/login_api.dart';
import 'package:zax/api/notes_api.dart';
import 'package:zax/bloc/app_action.dart';
import 'package:zax/bloc/app_state.dart';
import 'package:zax/dummy/dummy_notes.dart';
import 'package:zax/helper/app_config.dart';
import 'package:zax/model/login_handle.dart';

class AppBloc extends Bloc<AppActions, AppState> {
  final LoginAPIProtocol loginApi;
  final NotesAPIProtocol notesApi;

  AppBloc({
    required this.loginApi,
    required this.notesApi,
  }) : super(
          const AppState.empty(),
        ) {
    //? first app action
    on<LoginAction>((event, emit) async {
      //* Start Loading Action
      emit(
        const AppState(
          isLoading: true,
          loginError: null,
          loginHandle: null,
          notes: null,
        ),
      );
      //* logging user in
      final loginH =
          await loginApi.login(email: event.email, password: event.password);
      emit(
        AppState(
          isLoading: true,
          loginError: loginH == null ? LoginErrorHandler.invalidData : null,
          loginHandle: loginH,
          notes: null,
        ),
      );
    });

    //? second Action in app
    on<NotesAction>((event, emit) {
      //* Start Loading Action
      emit(
        AppState(
          isLoading: true,
          loginError: null,
          loginHandle: state.loginHandle,
          notes: null,
        ),
      );
      //* check if loginHandle == LoginHandler.test() .... if true load notes
      final loginHandle = state.loginHandle;
      if (loginHandle != const LoginHandler.test()) {
        emit(
          AppState(
            isLoading: false,
            loginError: LoginErrorHandler.invalidData,
            loginHandle: loginHandle,
            notes: null,
          ),
        );
        return;
      }
      emit(
        AppState(
          isLoading: false,
          loginError: null,
          loginHandle: loginHandle,
          notes: dummyNotes,
        ),
      );
    });
  }
}

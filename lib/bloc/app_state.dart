import 'package:flutter/foundation.dart' show immutable;
import 'package:zax/helper/app_config.dart';
import 'package:zax/model/login_handle.dart';

import '../model/note_handle.dart';

@immutable
class AppState {
  final bool isLoading;
  final LoginErrorHandler? loginError;
  final LoginHandler? loginHandle;
  final Iterable<Notes>? notes;

  //* initial State of the app when user didn't login yet or logout
  const AppState.empty()
      : isLoading = false,
        loginError = null,
        loginHandle = null,
        notes = null;

  const AppState({
    required this.isLoading,
    required this.loginError,
    required this.loginHandle,
    required this.notes,
  });

  @override
  String toString() => {
        'isLoading': isLoading,
        'loginError': loginError,
        'loginHandle': loginHandle,
        'notes': notes,
      }.toString();
}

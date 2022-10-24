import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AppActions {
  const AppActions();
}

@immutable
class LoginAction implements AppActions {
  final String email;
  final String password;

  const LoginAction({
    required this.email,
    required this.password,
  });
}

@immutable
class LoadNotesAction implements AppActions {
  const LoadNotesAction();
}

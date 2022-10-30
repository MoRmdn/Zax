import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:zax/helper/app_config.dart';
import 'package:zax/models/login_handle.dart';

import '../models/note_handle.dart';

extension UnorderedEquality on Object {
  bool isEqualTo(other) => const DeepCollectionEquality.unordered().equals(
        this,
        other,
      );
}

@immutable
class AppState {
  final bool isLoading;
  final LoginErrorHandler? loginError;
  final LoginHandler? loginHandle;
  final Iterable<Notes>? fetchedNotes;

  //* initial State of the app when user didn't login yet or logout
  const AppState.empty()
      : isLoading = false,
        loginError = null,
        loginHandle = null,
        fetchedNotes = null;

  const AppState({
    required this.isLoading,
    required this.loginError,
    required this.loginHandle,
    required this.fetchedNotes,
  });
  @override
  bool operator ==(covariant AppState other) {
    final otherPropertiesAreEqual = isLoading == other.isLoading &&
        loginError == other.loginError &&
        loginHandle == other.loginHandle;

    if (fetchedNotes == null && other.fetchedNotes == null) {
      return otherPropertiesAreEqual;
    } else {
      return otherPropertiesAreEqual &&
          (fetchedNotes?.isEqualTo(other.fetchedNotes) ?? false);
    }
  }

  @override
  int get hashCode => Object.hash(
        isLoading,
        loginError,
        loginHandle,
        fetchedNotes,
      );

  @override
  String toString() => {
        'isLoading': isLoading,
        'loginError': loginError,
        'loginHandle': loginHandle,
        'notes': fetchedNotes,
      }.toString();
}

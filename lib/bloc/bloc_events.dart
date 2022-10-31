import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AppEvent {
  const AppEvent();
}

//* action that will happen
@immutable
class LoadNextUrlEvent implements AppEvent {
  const LoadNextUrlEvent();
}

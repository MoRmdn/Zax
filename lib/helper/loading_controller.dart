import 'package:flutter/foundation.dart' show immutable;

typedef CloseLoadingController = bool Function();
typedef UpdateLoadingController = bool Function(String updateText);

@immutable
class LoadingScreenController {
  final CloseLoadingController close;
  final UpdateLoadingController update;

  const LoadingScreenController({
    required this.close,
    required this.update,
  });
}

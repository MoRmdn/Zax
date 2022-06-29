import 'dart:math' as math show Random;

//* add this method to Iterable Class
extension GetRandomValue<T> on Iterable<T> {
  T getRandomValue() => elementAt(math.Random().nextInt(length));
}

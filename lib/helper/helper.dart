import 'dart:developer' as devtools show log;
import 'dart:math' as math show Random;

//* add this method to Iterable Class
extension GetRandomValue<T> on Iterable<T> {
  T getRandomValue() => elementAt(math.Random().nextInt(length));
}

//* step 2 extensions
// extension UrlString on PersonUrl {
//   String get urlString {
//     switch (this) {
//       case PersonUrl.persons1:
//         return 'http://127.0.0.1:5500/api/person1.json';
//       case PersonUrl.persons2:
//         return 'http://127.0.0.1:5500/api/person2.json';
//     }
//   }
// }

// extension Log on Object {
//   void log() => devtools.log(toString());
// }

// extension Subscript<T> on Iterable<T> {
//   T? operator [](int index) => length > index ? elementAt(index) : null;
// }

//* Step 4 extensions

extension Log on Object {
  void log() => devtools.log(toString());
}

extension Subscript<T> on Iterable<T> {
  T? operator [](int index) => length > index ? elementAt(index) : null;
}

extension IsEqualToIgnoringOrdering<T> on Iterable<T> {
  bool isEqualToIgnoringOrdering(Iterable<T> other) =>
      length == other.length &&
      {...this}.intersection({...other}).length == length;
}

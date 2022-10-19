import 'package:flutter/foundation.dart' show immutable;

@immutable
class LoginHandler {
  final String token;
  const LoginHandler({
    required this.token,
  });

  const LoginHandler.test() : token = 'test';
  const LoginHandler.user() : token = 'user';

  // instead of instance of loginHandler will print the string
  @override
  String toString() => 'token is $token';

//  The == operator's implementation in Dart has to have 4 important qualities.
// Quality #1 is that this operator should be "total" meaning that it should only return a boolean and it should never throw

// Quality #2 is that it should be "reflexive" meaning that for the same object instance, it should return true. So if you instantiate an object and compare it to itself, it should always return true.

// Quality #3 is that it should be "symmetric" meaning that if object 1 is equal to object 2, then object 2 should also be equal to object 1 in the reverse manner

//  Quality #4 of the == operator and hence the last quality is that it should be "transitive" meaning that if object 1 is equal to object 2 and object 2 is equal to object 3 then object 1 should also be equal to object 3
  @override
  bool operator ==(Object other) =>
      other is LoginHandler &&
      other.runtimeType == runtimeType &&
      other.token == token;

  @override
  // TODO: implement hashCode
  int get hashCode => token.hashCode;
}

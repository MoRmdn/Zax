import 'package:flutter/foundation.dart' show immutable;
import 'package:zax/models/login_handle.dart';

@immutable
abstract class LoginAPIProtocol {
  const LoginAPIProtocol();

  // abstract make me initialize the function and didn't implement it
  Future<LoginHandler?> login({
    required String email,
    required String password,
  });
  Future<LoginHandler?> testLogin({
    required String email,
    required String password,
  });
}

@immutable
class LoginAPI implements LoginAPIProtocol {
  //* a software design pattern that restricts the instantiation of a class to one "single" instance.
  //* override default constructor with this constructor to prevent it to initialized
  const LoginAPI._onlyInstance();
  static const LoginAPI _shared = LoginAPI._onlyInstance();
  factory LoginAPI.instance() => _shared;

  @override
  Future<LoginHandler?> login({
    required String email,
    required String password,
  }) =>
      Future.delayed(
        const Duration(seconds: 1),
        // hardCoded
        () => email == 'user@t.com' && password == 'mohamed2022',
      ).then(
        //after delay and compare input value with this hardCoded values if they same will return true in then value and i will load loginHandler.test()
        (isLogIn) => isLogIn ? const LoginHandler.user() : null,
      );
  @override
  Future<LoginHandler?> testLogin({
    required String email,
    required String password,
  }) =>
      Future.delayed(
        const Duration(seconds: 1),
        // hardCoded
        () => email == 'test@t.com' && password == 'mohamed2022',
      ).then(
        //after delay and compare input value with this hardCoded values if they same will return true in then value and i will load loginHandler.test()
        (isLogIn) => isLogIn ? const LoginHandler.test() : null,
      );
}

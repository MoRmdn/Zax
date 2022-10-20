import 'package:flutter/material.dart' show Colors, Color;

enum LoginErrorHandler {
  invalidData,
}

class AppConfig {
  static const Color primaryColor = Color(0xff715CF8);
  static const Color authColors = Colors.white;
  static const double textFieldSized = 0.8;
  //? appTitle
  static const appTitle = 'Flutter Notes';

  //? Auth Screen ==>> routeName
  static const loginRouteName = '/loginScreen';
  static const signUpRouteName = '/signUpScreen';
  static const restPasswordRouteName = '/restPassword';

  static const login = 'Login';
  static const signUp = 'Sign Up';
  static const register = 'join us now';
  static const forgetPassword = 'Forget Password';
  static const resetPassword = 'Reset';

  static const emailOrPasswordEmptyDialogTitle =
      'Please fill in both email and the password fields';
  static const emailOrPasswordEmptyDescription =
      'You seem to have forgotten to enter either the email or the password field, or both. Please enter a valid email and password to continue!';
  static const loginErrorDialogTitle = 'Login error';
  static const loginErrorDialogContent =
      'Invalid email/password combination. Please try again with valid login credentials!';

  static const enterYourPasswordHere = 'Enter your password here...';
  static const enterYourEmailHere = 'Enter your email here...';
  static const enterYourNameHere = 'Enter your name here...';
  static const loginBackgroundImage = 'assets/images/2.png';
  static const signUpBackgroundImage = 'assets/images/1.png';
  static const forgetPasswordBackgroundImage = 'assets/images/3.png';

  //? generic
  static const pleaseWait = 'Please wait...';
  static const ok = 'OK';
  static const homePage = 'Home Page';
}

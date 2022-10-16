enum LoginErrorHandler {
  invalidData,
}

class AppConfig {}

class ConstStrings {
  static const appTitle = 'Flutter Notes';

  static const emailOrPasswordEmptyDialogTitle =
      'Please fill in both email and the password fields';

  static const emailOrPasswordEmptyDescription =
      'You seem to have forgotten to enter either the email or the password field, or both. Please enter a valid email and password to continue!';

  static const loginErrorDialogTitle = 'Login error';
  static const loginErrorDialogContent =
      'Invalid email/password combination. Please try again with valid login credentials!';

  static const pleaseWait = 'Please wait...';
  static const enterYourPasswordHere = 'Enter your password here...';
  static const enterYourEmailHere = 'Enter your email here...';
  static const ok = 'OK';
  static const login = 'Log in';
  static const homePage = 'Home Page';
}

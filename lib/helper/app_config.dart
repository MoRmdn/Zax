import 'package:flutter/material.dart' show Color, Colors, Widget;

enum LoginErrorHandler {
  invalidData,
}

enum AuthPageController {
  loginPage,
  signUpPage,
  forgetPassword,
}

// extension ToListView<T> on Iterable<T> {
//   Widget toListView() => IterableListView(
//         iterableList: this,
//       );
// }

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

  static const enterYourPasswordHere = 'Password';
  static const enterYourEmailHere = 'Email';
  static const enterYourNameHere = 'Name';

  static const emailOrPasswordEmptyDialogTitle =
      'Please fill in both email and the password fields';
  static const emailOrPasswordEmptyDescription =
      'You seem to have forgotten to enter either the email or the password field, or both. Please enter a valid email and password to continue!';
  static const emailOrPasswordOrNameEmptyDialogTitle =
      'Please fill in all name, email and the password fields';
  static const emailOrPasswordOrNameEmptyDescription =
      'You seem to have forgotten to enter either the name, email or the password field, or both. Please enter a valid email and password to continue!';
  static const forgetPasswordEmptyTitle = 'Please fill in  email field';
  static const forgetPasswordEmptyDescription =
      'You seem to have forgotten to enter email field, Please enter a valid email to continue!';
  static const loginErrorDialogTitle = 'Login error';
  static const loginErrorDialogContent =
      'Invalid email/password combination. Please try again with valid login credentials!';

  //? assets
  static const loginBackgroundImage = 'assets/images/2.png';
  static const signUpBackgroundImage = 'assets/images/1.png';
  static const forgetPasswordBackgroundImage = 'assets/images/3.png';
  static const loadingSvg = 'assets/svg/loading.svg';
  static const loadingGif = 'assets/gif/loading.gif';
  static const loadingColorizedGif = 'assets/gif/loading_colorized.gif';
  static const loadingFaceGif = 'assets/gif/loading_face.gif';
  static const loadingAndDone = 'assets/gif/loading_and_done.gif';

  //? generic
  static const pleaseWait = 'Please wait...';
  static const ok = 'OK';
  static const homePage = 'Home Page';
}

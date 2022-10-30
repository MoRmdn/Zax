import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zax/helper/app_config.dart';
import 'package:zax/screens/widget/login_screen/auth_view.dart';
import 'package:zax/screens/widget/login_screen/custom_text_button.dart';

import '../dialog/custom_generic_dialog.dart';
import '../dialog/loading_screen_dialog.dart';

typedef OnLoginTapped = void Function(
  String email,
  String password,
);

class LoginScreen extends StatefulWidget {
  static const routeName = AppConfig.loginRouteName;
  final OnLoginTapped onLoggingIn;
  const LoginScreen({super.key, required this.onLoggingIn});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

//? When an AnimationController is being created from a State,
//? you should have the State to extend either TickerProviderStateMixin or SingleTickerProviderStateMixin.
//? The latter is more optimized for when you only need to use a single ticker, which should be most of the case.
class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AuthPageController pageController = AuthPageController.loginPage;
  // bool isLogin = true;
  // bool isSignUp = false;
  // bool isForgetPassword = false;
  // bool isAnimated = false;
  final loading = LoadingScreen.instance();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  AnimationController? _animationController;
  Animation<Size>? _heightAnimation;
  Animation<Offset>? _offSetAnimation;
  @override
  void initState() {
    //* control the state and duration
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _offSetAnimation = Tween<Offset>(begin: const Offset(10, 20)).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.linear,
      ),
    );
    //* values of size that animation works between
    _heightAnimation = Tween<Size>(
      begin: const Size(double.infinity, 200),
      end: const Size(double.infinity, 280),
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.linear,
      ),
    );
    //? to listen to any change and update UI
    _animationController!.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    _animationController!.dispose();
    super.dispose();
  }

  void _switchController(AuthPageController page) => setState(() {
        pageController = page;
        pageController == AuthPageController.signUpPage
            ? _animationController!.forward()
            : _animationController!.reverse();
      });

  void _dialogBox(String title, String content) {
    //const
    loading.show(
      context: context,
      content: AppConfig.pleaseWait,
    );

    Future.delayed(const Duration(seconds: 1)).then((value) {
      loading.hide();
      customGenericDialog(
        context: context,
        title: title,
        content: content,
        dialogOptions: () {
          return {
            AppConfig.ok: true,
          };
        },
      );
    });
  }

  bool _checkEmptyTextField() {
    final email = emailController.text;
    final name = nameController.text;
    final password = passwordController.text;
    if (pageController == AuthPageController.loginPage) {
      if (email.isEmpty || password.isEmpty) {
        _dialogBox(
          AppConfig.emailOrPasswordEmptyDialogTitle,
          AppConfig.emailOrPasswordEmptyDialogTitle,
        );
        return false;
      }
      return true;
    } else if (pageController == AuthPageController.signUpPage) {
      if (email.isEmpty || password.isEmpty || name.isEmpty) {
        _dialogBox(
          AppConfig.emailOrPasswordOrNameEmptyDialogTitle,
          AppConfig.emailOrPasswordOrNameEmptyDialogTitle,
        );
        return false;
      }
      return true;
    } else if (pageController == AuthPageController.forgetPassword) {
      if (email.isEmpty) {
        _dialogBox(
          AppConfig.forgetPasswordEmptyTitle,
          AppConfig.forgetPasswordEmptyDescription,
        );
        return false;
      }
      return true;
    }
    return true;
  }

  void _onSave() {
    final email = emailController.text;
    final password = passwordController.text;
    final emptyError = _checkEmptyTextField();
    if (!emptyError) {
      log('EmptyFieldError');
      return;
    }

    if (pageController == AuthPageController.loginPage) {
      log('$email &&&&&&&  $password');
      widget.onLoggingIn(email, password);
      //? Login Auth
    } else if (pageController == AuthPageController.signUpPage) {
      //? Sign Up Logic
    } else if (pageController == AuthPageController.forgetPassword) {
      //? Reset Password
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          width: size.width,
          constraints: BoxConstraints(
            maxHeight: size.height,
            maxWidth: size.width,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                pageController == AuthPageController.loginPage
                    ? AppConfig.loginBackgroundImage
                    : pageController == AuthPageController.signUpPage
                        ? AppConfig.signUpBackgroundImage
                        : AppConfig.forgetPasswordBackgroundImage,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //? Top Space
                const Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                //? page title
                Text(
                  pageController == AuthPageController.loginPage
                      ? AppConfig.login
                      : pageController == AuthPageController.signUpPage
                          ? AppConfig.signUp
                          : AppConfig.forgetPassword,
                  style: GoogleFonts.lato(
                    color: pageController == AuthPageController.forgetPassword
                        ? AppConfig.primaryColor
                        : AppConfig.authColors,
                    textStyle:
                        pageController == AuthPageController.forgetPassword
                            ? Theme.of(context).textTheme.headline3
                            : Theme.of(context).textTheme.headline2,
                    // fontSize: 48,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                SizedBox(height: size.height * 0.05),
                AuthCard(
                  animationTween: _heightAnimation!,
                  animationController: _animationController!,
                  size: size,
                  loading: loading,
                  emailController: emailController,
                  nameController: nameController,
                  passwordController: passwordController,
                  pageController: pageController,
                  onLoginTap: _onSave,
                ),
                CustomTextButton(
                  changeColor:
                      pageController == AuthPageController.forgetPassword
                          ? true
                          : false,
                  title: pageController == AuthPageController.loginPage
                      ? AppConfig.signUp
                      : AppConfig.login,
                  buttonFun: () => _switchController(
                    pageController == AuthPageController.loginPage
                        ? AuthPageController.signUpPage
                        : AuthPageController.loginPage,
                  ),
                ),
                if (pageController == AuthPageController.loginPage)
                  CustomTextButton(
                    title: AppConfig.forgetPassword,
                    buttonFun: () => _switchController(
                      AuthPageController.forgetPassword,
                    ),
                  ),
                //? bottom Space
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zax/helper/app_config.dart';
import 'package:zax/screens/widget/login_screen/custom_text_button.dart';
import 'package:zax/screens/widget/login_screen/custom_text_field.dart';
import 'package:zax/screens/widget/login_screen/login_button.dart';
import 'package:zax/screens/widget/login_screen/password_text_field.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = AppConfig.loginRouteName;
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

//? When an AnimationController is being created from a State,
//? you should have the State to extend either TickerProviderStateMixin or SingleTickerProviderStateMixin.
//? The latter is more optimized for when you only need to use a single ticker, which should be most of the case.
class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  bool isSignUp = false;
  bool isForgetPassword = false;
  bool isAnimated = false;
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  AnimationController? _animationController;
  Animation<Size>? _animationTween;

  @override
  void initState() {
    //* control the state and duration
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    //* values that animation work between
    _animationTween = Tween<Size>(
      begin: const Size(double.infinity, 230),
      end: const Size(double.infinity, 300),
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

  void _switchController(String title) => setState(() {
        if (title == AppConfig.login) {
          isLogin = true;
          isSignUp = false;
          isForgetPassword = false;
          isAnimated
              ? _animationController!.reverse().then(
                    (value) => isAnimated = false,
                  )
              : null;
        } else if (title == AppConfig.signUp) {
          isLogin = false;
          isForgetPassword = false;
          isSignUp = true;
          _animationController!.forward().then(
                (value) => isAnimated = true,
              );
        } else {
          isLogin = false;
          isSignUp = false;
          isForgetPassword = true;
          isAnimated
              ? _animationController!.reverse().then(
                    (value) => isAnimated = false,
                  )
              : null;
        }
      });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: size.width,
        constraints: BoxConstraints(
          maxHeight: size.height,
          maxWidth: size.width,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              isLogin
                  ? AppConfig.loginBackgroundImage
                  : isSignUp
                      ? AppConfig.signUpBackgroundImage
                      : AppConfig.forgetPasswordBackgroundImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            Text(
              isLogin
                  ? AppConfig.login
                  : isSignUp
                      ? AppConfig.signUp
                      : AppConfig.forgetPassword,
              style: GoogleFonts.lato(
                color: isForgetPassword
                    ? AppConfig.primaryColor
                    : AppConfig.authColors,
                textStyle: isForgetPassword
                    ? Theme.of(context).textTheme.headline3
                    : Theme.of(context).textTheme.headline2,
                // fontSize: 48,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(10),
                height: _animationTween!.value.height,
                constraints: BoxConstraints(
                  minHeight: _animationTween!.value.height,
                  maxWidth: size.width * 0.8,
                ),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    if (isLogin || isSignUp)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isSignUp)
                            SizedBox(
                              child: CustomTextField(
                                controller: emailController,
                                textHint: AppConfig.enterYourNameHere,
                              ),
                            ),
                          SizedBox(
                            child: CustomTextField(
                              controller: emailController,
                              textHint: AppConfig.enterYourEmailHere,
                            ),
                          ),
                          SizedBox(
                            child: CustomPasswordTextField(
                              passwordController: passwordController,
                            ),
                          ),
                        ],
                      ),
                    if (isForgetPassword)
                      SizedBox(
                        child: CustomTextField(
                          controller: emailController,
                          textHint: AppConfig.enterYourEmailHere,
                        ),
                      ),
                    LoginButton(
                      title: isLogin
                          ? AppConfig.login
                          : isSignUp
                              ? AppConfig.signUp
                              : AppConfig.resetPassword,
                      emailController: emailController,
                      passwordController: passwordController,
                      onLoginTapped: (String email, String password) {},
                    ),
                  ],
                ),
              ),
            ),
            CustomTextButton(
              changeColor: isForgetPassword,
              title: isLogin ? AppConfig.signUp : AppConfig.login,
              buttonFun: () => _switchController(
                isLogin ? AppConfig.signUp : AppConfig.login,
              ),
            ),
            if (isLogin)
              CustomTextButton(
                changeColor: isForgetPassword,
                title: AppConfig.forgetPassword,
                buttonFun: () => _switchController(
                  AppConfig.forgetPassword,
                ),
              ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}

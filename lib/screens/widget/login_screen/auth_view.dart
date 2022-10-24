import 'package:flutter/material.dart';

import '../../../dialog/loading_screen_dialog.dart';
import '../../../helper/app_config.dart';
import '../../widget/login_screen/password_text_field.dart';
import 'custom_text_field.dart';
import 'login_button.dart';

@immutable
class AuthView extends StatefulWidget {
  final LoadingScreen loading;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final Size size;
  final AuthPageController pageController;
  final AnimationController animationController;
  final Animation<Size> animationTween;
  final VoidCallback onLoginTap;

  const AuthView({
    super.key,
    required this.animationTween,
    required this.animationController,
    required this.size,
    required this.loading,
    required this.emailController,
    required this.nameController,
    required this.passwordController,
    required this.pageController,
    required this.onLoginTap,
  });

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(10),
        height: widget.animationTween.value.height,
        constraints: BoxConstraints(
          minHeight: widget.animationTween.value.height,
          maxWidth: widget.size.width * 0.8,
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            if (widget.pageController == AuthPageController.loginPage ||
                widget.pageController == AuthPageController.signUpPage)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.pageController == AuthPageController.signUpPage)
                    SizedBox(
                      child: CustomTextField(
                        controller: widget.nameController,
                        textHint: AppConfig.enterYourNameHere,
                      ),
                    ),
                  SizedBox(
                    child: CustomTextField(
                      controller: widget.emailController,
                      textHint: AppConfig.enterYourEmailHere,
                    ),
                  ),
                  SizedBox(
                    child: CustomPasswordTextField(
                      passwordController: widget.passwordController,
                    ),
                  ),
                ],
              ),
            if (widget.pageController == AuthPageController.forgetPassword)
              SizedBox(
                child: CustomTextField(
                  controller: widget.emailController,
                  textHint: AppConfig.enterYourEmailHere,
                ),
              ),
            LoginButton(
              title: widget.pageController == AuthPageController.loginPage
                  ? AppConfig.login
                  : widget.pageController == AuthPageController.signUpPage
                      ? AppConfig.signUp
                      : AppConfig.resetPassword,
              emailController: widget.emailController,
              passwordController: widget.passwordController,
              onLoginTapped: widget.onLoginTap,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zax/helper/app_config.dart';
import 'package:zax/screens/widget/login_screen/custom_text_field.dart';
import 'package:zax/screens/widget/login_screen/cutom_text_button.dart';
import 'package:zax/screens/widget/login_screen/login_button.dart';
import 'package:zax/screens/widget/login_screen/password_text_field.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = AppConfig.loginRouteName;
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppConfig.loginBackgroundImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: SizedBox(),
            ),
            Text(
              AppConfig.login,
              style: GoogleFonts.lato(
                color: AppConfig.authColors,
                textStyle: Theme.of(context).textTheme.headline2,
                // fontSize: 48,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: size.width * AppConfig.textFieldSized,
                  child: CustomTextField(
                    emailController: emailController,
                    textHint: AppConfig.enterYourEmailHere,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                SizedBox(
                  width: size.width * AppConfig.textFieldSized,
                  child: CustomPasswordTextField(
                    passwordController: passwordController,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            LoginButton(
              emailController: emailController,
              passwordController: passwordController,
              onLoginTapped: (String email, String password) {},
            ),
            const CustomTextButton(
              title: AppConfig.register,
            ),
            const CustomTextButton(
              title: AppConfig.forgetPassword,
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}

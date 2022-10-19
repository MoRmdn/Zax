import 'package:flutter/material.dart';

import '../../../dialog/custom_generic_dialog.dart';
import '../../../helper/app_config.dart';

typedef OnLoginTapped = void Function(
  String email,
  String password,
);

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final OnLoginTapped onLoginTapped;
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onLoginTapped,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
          const EdgeInsets.symmetric(horizontal: 50),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          Colors.black,
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(0xffFDFEF7),
        ),
      ),
      onPressed: () {
        customGenericDialog(
          context: context,
          title: 'login',
          content: 'content',
          dialogOptions: () {
            return {'String': true};
          },
        );
      },
      child: const Text(AppConfig.login),
    );
  }
}

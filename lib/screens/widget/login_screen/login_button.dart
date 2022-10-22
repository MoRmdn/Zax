import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLoginTapped;

  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onLoginTapped,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
            const EdgeInsets.symmetric(horizontal: 20),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          // foregroundColor: MaterialStateProperty.all<Color>(
          //   Colors.black,
          // ),
          // backgroundColor: MaterialStateProperty.all<Color>(
          //   const Color(0xffFDFEF7),
          // ),
        ),
        onPressed: onLoginTapped,
        child: Text(title),
      ),
    );
  }
}

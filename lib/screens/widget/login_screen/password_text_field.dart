import 'package:flutter/material.dart';

import '../../../helper/app_config.dart';

class CustomPasswordTextField extends StatelessWidget {
  final TextEditingController passwordController;

  const CustomPasswordTextField({
    super.key,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        autocorrect: false,
        obscureText: true,
        obscuringCharacter: '◉',
        decoration: InputDecoration(
          label: const Text(
            AppConfig.enterYourPasswordHere,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          hintText: AppConfig.enterYourPasswordHere,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          filled: true, //<-- SEE HERE
          fillColor: AppConfig.authColors,
        ),
      ),
    );
  }
}

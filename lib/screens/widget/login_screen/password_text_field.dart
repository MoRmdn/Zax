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
    return TextField(
      controller: passwordController,
      keyboardType: TextInputType.visiblePassword,
      autocorrect: false,
      obscureText: true,
      obscuringCharacter: '◉',
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: AppConfig.enterYourPasswordHere,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        filled: true, //<-- SEE HERE
        fillColor: AppConfig.authColors,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../helper/app_config.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController emailController;
  final String textHint;
  final TextInputType? kType;
  const CustomTextField({
    super.key,
    required this.emailController,
    required this.textHint,
    this.kType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailController,
      keyboardType: kType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: textHint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        filled: true, //<-- SEE HERE
        fillColor: AppConfig.authColors,
      ),
    );
  }
}

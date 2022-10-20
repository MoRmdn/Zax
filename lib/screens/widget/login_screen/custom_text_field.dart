import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String textHint;
  final TextInputType? kType;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.textHint,
    this.kType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        keyboardType: kType,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          hintText: textHint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          // filled: true, //<-- SEE HERE
          // fillColor: AppConfig.authColors,
        ),
      ),
    );
  }
}

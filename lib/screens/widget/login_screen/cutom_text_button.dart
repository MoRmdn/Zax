import 'package:flutter/material.dart';

import '../../../dialog/custom_generic_dialog.dart';

class CustomTextButton extends StatelessWidget {
  final String title;

  const CustomTextButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        // padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
        //   const EdgeInsets.symmetric(horizontal: 50),
        // ),
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
      child: Text(
        title,
      ),
    );
  }
}

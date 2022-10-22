import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final VoidCallback buttonFun;
  final bool? changeColor;

  const CustomTextButton({
    super.key,
    required this.title,
    required this.buttonFun,
    this.changeColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        // padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
        //   const EdgeInsets.symmetric(horizontal: 50),
        // ),
        // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //   RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(20.0),
        //   ),
        // ),

        foregroundColor: !changeColor!
            ? MaterialStateProperty.all<Color>(
                const Color(0xffFDFEF7),
              )
            : null,
        // backgroundColor: MaterialStateProperty.all<Color>(
        //   const Color(0xffFDFEF7),
        // ),
      ),
      onPressed: buttonFun,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}

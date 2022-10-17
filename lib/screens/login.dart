import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zax/helper/app_config.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = AppConfig.loginRouteName;
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
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
              ConstStrings.login,
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
                  child: TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      filled: true, //<-- SEE HERE
                      fillColor: AppConfig.authColors,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                SizedBox(
                  width: size.width * AppConfig.textFieldSized,
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    obscuringCharacter: '◉',
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      filled: true, //<-- SEE HERE
                      fillColor: AppConfig.authColors,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            ElevatedButton(
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
              onPressed: null,
              child: const Text(ConstStrings.login),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}

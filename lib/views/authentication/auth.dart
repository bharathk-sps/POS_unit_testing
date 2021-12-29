import 'package:flutter/material.dart';
import 'package:poc_unit_test/components/constants.dart';
import 'package:poc_unit_test/components/responsive.dart';
import 'package:poc_unit_test/views/authentication/signin.dart';
import 'package:poc_unit_test/views/authentication/signup.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Widget authForm(double width) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonTheme(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          isLoginPage ? kGreen : kWhite),
                    ),
                    onPressed: () {
                      setState(() {
                        isLoginPage = true;
                      });
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: isLoginPage ? kWhite : kBlack),
                    ),
                  ),
                ),
                ButtonTheme(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          isLoginPage ? kWhite : kGreen),
                    ),
                    onPressed: () {
                      setState(() {
                        isLoginPage = false;
                      });
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: isLoginPage ? kBlack : kWhite),
                    ),
                  ),
                ),
              ],
            ),
          ),
          isLoginPage ? const SignIn() : const SignUp(),
        ],
      ),
    );
  }

  bool isLoginPage = true;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Responsive(
          mobile: authForm(width),
          tablet: SizedBox(
            width: double.infinity,
            child: Center(
              child: authForm(width / 2),
            ),
          ),
          desktop: SizedBox(
            width: double.infinity,
            child: Center(
              child: authForm(width / 2),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:poc_unit_test/views/authentication/signin.dart';
import 'package:poc_unit_test/views/authentication/signup.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLoginPage = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 32.0),
                child: Row(
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            isLoginPage ? Colors.green : Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          isLoginPage = true;
                        });
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: isLoginPage ? Colors.white : Colors.blue),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            isLoginPage ? Colors.white : Colors.green),
                      ),
                      onPressed: () {
                        setState(() {
                          isLoginPage = false;
                        });
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: isLoginPage ? Colors.blue : Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              isLoginPage ? const SignIn() : const SignUp(),
            ],
          ),
        ),
      ),
    );
  }
}

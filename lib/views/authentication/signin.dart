import 'package:flutter/material.dart';
import 'package:poc_unit_test/services/auth_services.dart';
import 'package:poc_unit_test/views/homescreen/home_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _signinFormKey = GlobalKey<FormState>();

  bool obscureText = true;
  String errorText = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signinFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              key:const Key("signInUser"),
              controller: userNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Field should not be empty";
                } else if (value.length < 8) {
                  return "Field should contain minimum 8 Characters";
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                hintText: "Enter user name",
                prefixIcon: Icon(Icons.account_circle_outlined),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              key:const Key("signInPwd"),
              controller: passwordController,
              obscureText: obscureText,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Field should not be empty";
                } else if (value.length < 8) {
                  return "Field should contain minimum 8 Characters";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: "Enter password",
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(!obscureText
                        ? Icons.visibility_off
                        : Icons.visibility)),
                prefixIcon: const Icon(Icons.vpn_key_outlined),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Center(
              child: Text(
                errorText,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            if (errorText != "")
              const SizedBox(
                height: 16.0,
              ),
            SizedBox(
              width: double.infinity,
              height: 40.0,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: () {
                  errorText = "";
                  if (_signinFormKey.currentState!.validate()) {
                    bool? value = AuthService().signIn(
                        userNameController.text, passwordController.text);
                    if (value!) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                userName: userNameController.text,
                              )));
                    } else {
                      errorText =
                          "Account doesn't exist, Please create an account";
                    }
                  }
                  setState(() {});
                },
                child: const Text(
                  "Sign In to Account",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

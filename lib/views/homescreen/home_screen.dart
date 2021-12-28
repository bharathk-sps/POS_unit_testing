import 'package:flutter/material.dart';
import 'package:poc_unit_test/views/authentication/auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.userName}) : super(key: key);
  final String? userName;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const AuthScreen()));
              },
              child:
                  const Text("Log out", style: TextStyle(color: Colors.white))),
        ],
      ),
      body: Center(
        child: Text("Welcome ${widget.userName}!"),
      ),
    );
  }
}

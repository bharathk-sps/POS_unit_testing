import 'package:flutter/material.dart';
import 'package:poc_unit_test/views/authentication/auth.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthScreen(),
    );
  }
}

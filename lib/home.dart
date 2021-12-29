import 'package:flutter/material.dart';
import 'package:poc_unit_test/views/authentication/auth.dart';
import 'package:poc_unit_test/views/authentication/auth_wrapper.dart';
import 'package:poc_unit_test/views/homescreen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthWrapper(),
    );
  }
}

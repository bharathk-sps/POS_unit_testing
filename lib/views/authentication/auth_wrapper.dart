import 'package:flutter/material.dart';
import 'package:poc_unit_test/services/auth_services.dart';
import 'package:poc_unit_test/views/authentication/auth.dart';
import 'package:poc_unit_test/views/homescreen/home_screen.dart';
import 'package:poc_unit_test/views/splashscreen/splash.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AuthService.instance.getAuthState(),
        builder: (context, snap) {
          if (snap.hasData) {
            String value = snap.data as String;
            if (value.isNotEmpty) return HomeScreen(userName: value);
            return const AuthScreen();
          } else {
            return const Splash();
          }
        });
  }
}

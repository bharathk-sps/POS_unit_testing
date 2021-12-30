


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poc_unit_test/views/authentication/auth.dart';

authWidgetTest() {
  group("Authentication widget check", () {
    group("SignIn Validation", () {
      testWidgets("SignIn Empty Form Validation", (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: AuthScreen(),
        ));
        final signIn = find.text("Sign In");
        await tester.tap(signIn);
        await tester.pump();
        final buttonFinder = find.text('Sign In to Account');
        final emptyErrorFinder = find.text('Field should not be empty');
        expect(emptyErrorFinder, findsNothing);
        await tester.tap(buttonFinder);
        await tester.pump();
        expect(emptyErrorFinder, findsWidgets);
      });
      testWidgets("SignIn Form length Validation", (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: AuthScreen(),
        ));
        final signIn = find.text("Sign In");
        await tester.tap(signIn);
        await tester.pump();
        Finder userName = find.byKey(const Key("signInUser"));
        Finder password = find.byKey(const Key("signInPwd"));

        await tester.enterText(userName, "user");
        await tester.enterText(password, "pass");

        final buttonFinder = find.text('Sign In to Account');
        final lengthErrorFinder =
            find.text('Field should contain minimum 8 Characters');
        expect(lengthErrorFinder, findsNothing);
        await tester.tap(buttonFinder);
        await tester.pump(const Duration(milliseconds: 400));
        expect(lengthErrorFinder, findsWidgets);
      });
    });
    group("SignUp Validation", () {
      testWidgets("SignUp Empty Form Validation", (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: AuthScreen(),
        ));
        final signUp = find.text("Sign Up");
        await tester.tap(signUp);
        await tester.pump();
        final buttonFinder = find.text('Create Account');
        final emptyErrorFinder = find.text('Field should not be empty');
        expect(emptyErrorFinder, findsNothing);
        await tester.tap(buttonFinder);
        await tester.pump();
        expect(emptyErrorFinder, findsWidgets);
      });
      testWidgets("SignUp Form length Validation", (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: AuthScreen(),
        ));
        final signUp = find.text("Sign Up");
        await tester.tap(signUp);
        await tester.pump();
        Finder userName = find.byKey(const Key("signUpUser"));
        Finder password = find.byKey(const Key("signUpPwd"));

        await tester.enterText(userName, "user");
        await tester.enterText(password, "pass");

        final buttonFinder = find.text('Create Account');
        final lengthErrorFinder =
            find.text('Field should contain minimum 8 Characters');
        expect(lengthErrorFinder, findsNothing);
        await tester.tap(buttonFinder);
        await tester.pump(const Duration(milliseconds: 400));
        expect(lengthErrorFinder, findsWidgets);
      });
    });
  });
}

//Test will fail
// authWidgetFailedTest() {
//   group("Authentication widget check", () {
//     group("SignIn Validation", () {
//       testWidgets("Empty From Validation", (WidgetTester tester) async {
//         await tester.pumpWidget(const MaterialApp(
//           home: AuthScreen(),
//         ));
//         final buttonFinder = find.text('Sign In to Account');
//         final emptyErrorFinder = find.text('Field should not be empty');
//         expect(emptyErrorFinder, findsNothing);
//         await tester.tap(buttonFinder);
//         await tester.pump();
//         expect(emptyErrorFinder, findsNothing);
//       });
//       testWidgets("Form length Validation", (WidgetTester tester) async {
//         await tester.pumpWidget(const MaterialApp(
//           home: AuthScreen(),
//         ));
//         Finder userName = find.byKey(const Key("signInUser"));
//         Finder password = find.byKey(const Key("signInPwd"));
//
//         await tester.enterText(userName, "user_name");
//         await tester.enterText(password, "user_password");
//
//         final buttonFinder = find.text('Sign In to Account');
//         final lengthErrorFinder =
//             find.text('Field should contain minimum 8 Characters');
//         expect(lengthErrorFinder, findsNothing);
//         await tester.tap(buttonFinder);
//         await tester.pump(const Duration(milliseconds: 400));
//         expect(lengthErrorFinder, findsWidgets);
//       });
//     });
//   });
// }
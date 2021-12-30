import 'package:flutter_test/flutter_test.dart';
import 'package:poc_unit_test/models/auth_model.dart';
import 'package:poc_unit_test/services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

authPrefsTest() {
  AuthService authService = AuthService.instance;
  group("SharedPrefs test", () {
    test("should get User", () async {
      await authService.getFutureData();
      int value = await authService.calculateList();
      expect(value, 10);
    });
    // test("should get Empty User", () async {
    //   String? value = await authService.getAuthState();
    //   expect(value, "");
    // });
  });
}

authServiceTest() {
  group("AuthService", () {
    group("SignIn Check", () {
      test("should signIn", () {
        AuthUser user =
            AuthUser(userName: "bharath_kumar", password: "123456789");
        bool? isAuthenticated =
            AuthService.instance.signIn(user.userName, user.password);
        expect(isAuthenticated, true);
      });
      test("should not signIn", () async {
        AuthUser user = AuthUser(userName: "wrong_user", password: "123456789");
        bool? isAuthenticated =
            AuthService.instance.signIn(user.userName, user.password);
        expect(isAuthenticated, false);
      });
    });
    group("SignUp Check", () {
      test("should signUp", () {
        AuthUser user =
            AuthUser(userName: "new_user", password: "new_password");
        bool? isAuthenticated =
            AuthService.instance.signUp(user.userName, user.password);
        expect(isAuthenticated, true);
      });

      test("should not signUp", () {
        AuthUser user =
            AuthUser(userName: "another_user", password: "123456789");
        bool? isAuthenticated =
            AuthService.instance.signUp(user.userName, user.password);
        expect(isAuthenticated, false);
      });
    });
  });
}

//Test will fail

// authServiceFailTest() {
//   group("AuthService", () {
//     group("SignIn Check", () {
//       test("should signIn", () {
//         AuthUser user =
//         AuthUser(userName: "bharath_kum", password: "123456789");
//         bool? isAuthenticated =
//         AuthService.instance.signIn(user.userName, user.password);
//         expect(isAuthenticated, true);
//       });
//       test("should not signIn", () {
//         AuthUser user = AuthUser(userName: "bharath_kumar", password: "123456789");
//         bool? isAuthenticated =
//         AuthService.instance.signIn(user.userName, user.password);
//         expect(isAuthenticated, false);
//       });
//     });
//     group("SignUp Check", () {
//       test("should signUp", () {
//         AuthUser user =
//         AuthUser(userName: "bharath_kumar", password: "123456789");
//         bool? isAuthenticated =
//         AuthService.instance.signUp(user.userName, user.password);
//         expect(isAuthenticated, true);
//       });
//
//       test("should not signUp", () {
//         AuthUser user =
//         AuthUser(userName: "new_user", password: "12345678");
//         bool? isAuthenticated =
//         AuthService.instance.signUp(user.userName, user.password);
//         expect(isAuthenticated, false);
//       });
//     });
//   });
// }

import 'package:poc_unit_test/models/auth_model.dart';

List<AuthUser> dummydata = [
  AuthUser(userName: "bharath_kumar", password: "123456789"),
  AuthUser(userName: "another_user", password: "123456789"),
];

class AuthService {
  bool? checkUser(AuthUser user) {
    List<AuthUser> existingUser = dummydata
        .where(
          (element) =>
              element.userName == user.userName &&
              element.password == user.password,
        )
        .toList();
    if (existingUser.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool? signIn(String? userName, String? password) {
    AuthUser user = AuthUser(userName: userName, password: password);
    return checkUser(user);
  }

  bool? signUp(String? userName, String? password) {
    AuthUser user = AuthUser(userName: userName, password: password);
    if (checkUser(user)!) {
      return false;
    }
    dummydata.add(user);
    return true;
  }
}

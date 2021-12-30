import 'package:flutter/cupertino.dart';
import 'package:poc_unit_test/components/constants.dart';
import 'package:poc_unit_test/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<AuthUser> dummydata = [
  AuthUser(userName: "bharath_kumar", password: "123456789"),
  AuthUser(userName: "another_user", password: "123456789"),
];

class AuthService {

  AuthService._();

  static final AuthService _singleton = AuthService._();

  static AuthService get instance => _singleton;

  Future<String?> getAuthState() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    try {
      String? value = _prefs.getString(kAuthStateKey) ?? "";
      return value;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  late List<int> _listOfNo;

  List<int> get listOfNo => _listOfNo;

  Future<void> getFutureData() async {
    try {
      _listOfNo = await Future.delayed(const Duration(seconds: 2),
          () => List.generate(10, (index) => index + 1));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<int> calculateList() async {
    try {
      return await Future.delayed(
          const Duration(seconds: 2), () => _listOfNo.length);
    } catch (e) {
      debugPrint(e.toString());
      return 0;
    }
  }

  Future<bool> setAuthState(String user) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    try {
      return await _prefs.setString(kAuthStateKey, user);
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

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

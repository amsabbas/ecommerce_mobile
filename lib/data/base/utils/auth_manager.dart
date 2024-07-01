import 'dart:convert';

import 'package:ecommerce_mobile/data/user/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../user/model/user_model.dart';

class AuthManager {
  static const userKey = "user";
  static const tokenKey = "token";
  final SharedPreferences _sharedPref;

  AuthManager({required sharedPreferences}) : _sharedPref = sharedPreferences;

  UserModel? getUser() {
    String? userModel = _sharedPref.getString(userKey);
    if (userModel != null) {
      return UserModel.fromJson(jsonDecode(userModel));
    }
    return null;
  }

  Future<bool> saveUser(UserModel userModel) async {
    return await _sharedPref.setString(userKey, jsonEncode(userModel));
  }

  Future<bool> saveToken(LoginModel model) async {
    return await _sharedPref.setString(tokenKey, model.accessToken);
  }

  String? getToken() {
    return _sharedPref.getString(tokenKey);
  }

  Future<void> deleteToken() async {
    try {
      await _sharedPref.remove(tokenKey);
      return;
    } catch (_) {
      return;
    }
  }

  Future<void> deleteUser() async {
    try {
      await _sharedPref.remove(userKey);
      return;
    } catch (_) {
      return;
    }
  }
}

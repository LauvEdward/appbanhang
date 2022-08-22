import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class AppSharePreference {
  static AppSharePreference share = AppSharePreference();

  //=======================
  var _tokenLogin = "Xtoken";
  Future<bool> setTokenSharePreference(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_tokenLogin, token);
  }

  Future<String> getTokenSharePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenLogin) ?? "";
  }

  Future<bool> removekey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }
}

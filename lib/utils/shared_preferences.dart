import 'package:shared_preferences/shared_preferences.dart';

class RememberLoginData {
  Future<bool> setRememberEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString("email", email);
  }

  Future<String> getRememberedEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("email") ?? '';
  }

  Future<bool> setRememberPassword(String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString("password", password);
  }

  Future<String> getRememberedPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("password") ?? '';
  }
}

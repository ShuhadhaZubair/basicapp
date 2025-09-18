import 'package:basicui/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthRepository {
  static const keyEmail = "email";
  static const keyPassword = "password";
  static const keyName = "name";
  static const keyLoggedIn = "isLoggedIn";

  Future<void> signup(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyEmail, user.email);
    await prefs.setString(keyPassword, user.password);
    await prefs.setString(keyName, user.name);
    await prefs.setBool(keyLoggedIn, true);
  }

  Future<bool> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString(keyEmail);
    final savedPassword = prefs.getString(keyPassword);

    if (savedEmail == email && savedPassword == password) {
      await prefs.setBool(keyLoggedIn, true);
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyLoggedIn, false);
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyLoggedIn) ?? false;
  }
}

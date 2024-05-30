import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static const String _keyToken = "token";
  static const String _keyPassword = "password";

  static void saveToken({required String token}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(_keyToken, token);
  }

  static Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString(_keyToken);
    return token;
  }

  static void savePassword({required String password}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(_keyPassword, password);
  }

  static Future<String?> getPassword() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? password = preferences.getString(_keyPassword);
    return password;
  }

  static void removeToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(_keyToken);
  }

  static void removeAllKeys() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}

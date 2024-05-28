import 'package:shared_preferences/shared_preferences.dart';

String _keyToken = "token";
String _passToken = "pass";

//untuk menyimpan token username
class ShredPref {
  static void saveToken({required String token}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_keyToken, token);
  }

  static Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? token = preferences.getString(_keyToken);
    return token;
  }

//untuk menyimpan token password
  static void savePass({required String pass}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_passToken, pass);
  }

  static Future<String?> getPassToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? pass = preferences.getString(_passToken);
    return pass;
  }

  static void removeToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(_keyToken);
  }

// pakai yang ini untuk sekaligus menghapus semua token ketika user log out
  static void removeAllKey() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static const String _keyToken = "token";
  static const String _keyPassword = "password";
  static const String _keyForgotPasswordEmail = "forgotPasswordEmail";
  static const String _keyOtpNumber = "otpNumber";

  static Future<SharedPreferences> get _preferences async =>
      await SharedPreferences.getInstance();

  static Future<void> _saveString(String key, String value) async {
    final preferences = await _preferences;
    await preferences.setString(key, value);
  }

  static Future<String?> _getString(String key) async {
    final preferences = await _preferences;
    return preferences.getString(key);
  }

  static Future<void> _remove(String key) async {
    final preferences = await _preferences;
    await preferences.remove(key);
  }

  static void saveToken({required String token}) =>
      _saveString(_keyToken, token);

  static Future<String?> getToken() => _getString(_keyToken);

  static void savePassword({required String password}) =>
      _saveString(_keyPassword, password);

  static Future<String?> getPassword() => _getString(_keyPassword);

  static void saveForgotPasswordEmail({required String email}) =>
      _saveString(_keyForgotPasswordEmail, email);

  static Future<String?> getForgotPasswordEmail() =>
      _getString(_keyForgotPasswordEmail);

  static void saveOtpNumber({required String otp}) =>
      _saveString(_keyOtpNumber, otp);

  static Future<String?> getOtpNumber() => _getString(_keyOtpNumber);

  static void removeToken() => _remove(_keyToken);

  static void removeForgotPasswordEmail() => _remove(_keyForgotPasswordEmail);

  static void removeOtpNumber() => _remove(_keyOtpNumber);

  static Future<void> removeAllKeys() async {
    final preferences = await _preferences;
    await preferences.clear();
  }
}

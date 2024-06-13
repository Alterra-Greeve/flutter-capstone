class ApiConstant {
  static const String baseUrl = 'https://api.greeve.store/api/v1';

  static const String register = '$baseUrl/user/register';
  static const String login = '$baseUrl/user/login';
  static const String user = '$baseUrl/user';
  static const String forgotPassword = '$baseUrl/user/forgot-password';
  static const String verifyOtp = '$baseUrl/user/verify-otp';
  static const String resetPassword = '$baseUrl/user/reset-password';

  static const String products = '$baseUrl/products';
  static const String productsSearch = '$baseUrl/products/search';
  static const String productsCategory = '$baseUrl/products/category';

  static const String leaderBoard = '$baseUrl/leaderboard';
}
class ApiConstant {
  static const String baseUrl = 'https://api.greeve.store/api/v1';

  static const String register = '$baseUrl/user/register';
  static const String login = '$baseUrl/user/login';
  static const String userProfile = '$baseUrl/user';
  static const String forgotPassword = '$baseUrl/user/forgot-password';
  static const String verifyOtp = '$baseUrl/user/verify-otp';
  static const String resetPassword = '$baseUrl/user/reset-password';
  static const String impact = '$baseUrl/impact';
  static const String impactPoint = '$baseUrl/dashboard';
  static const String products = '$baseUrl/products';
  static const String productsSearch = '$baseUrl/products/search';
  static const String productsCategory = '$baseUrl/products/category';
  static const String productsRecommendation = '$baseUrl/products/recommendation';
  static const String cart = '$baseUrl/cart';
  static const String transactions = '$baseUrl/transactions';
  static const String userChallenge = '$baseUrl/challenges/participate?status';
  static const String challenges = '$baseUrl/challenges';
  static const String challengesParticipate = '$baseUrl/challenges/participate';
  static const String userMembership = '$baseUrl/user/membership';
  static const String leaderBoard = '$baseUrl/leaderboard';
}

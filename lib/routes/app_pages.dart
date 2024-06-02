import 'package:get/get.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/view/forgot_password/screens/confirmation_screen.dart';
import 'package:greeve/view/forgot_password/screens/forgot_password_screen.dart';
import 'package:greeve/view/forgot_password/screens/new_pass_screen.dart';
import 'package:greeve/view/forgot_password/screens/otp_screen.dart';
import 'package:greeve/view/home/screens/home_screen.dart';
import 'package:greeve/view/login/screens/loading_screen.dart';
import 'package:greeve/view/login/screens/login_screen.dart';
import 'package:greeve/view/onboarding/screens/on_boarding_screen.dart';
import 'package:greeve/view/register/register_success_screen.dart';
import 'package:greeve/view/register/screens/register_screen.dart';
import 'package:greeve/view/splash_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splashApp,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPassScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => const OtpScreen(),
    ),
    GetPage(
      name: AppRoutes.confirmPassword,
      page: () => const ConfirmPassScreen(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: AppRoutes.registerSuccess,
      page: () => const RegisterSuccessScreen(),
    ),
    GetPage(
      name: AppRoutes.newPassword,
      page: () => const NewPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.loading,
      page: () => const LoadingScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnBoardingScreen(),
    ),
  ];
}

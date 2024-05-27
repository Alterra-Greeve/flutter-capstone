import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/routes_constant.dart';
import 'package:greeve/view/forgot_password/screens/confirmation_screen.dart';
import 'package:greeve/view/forgot_password/screens/forgot_password_screen.dart';
import 'package:greeve/view/forgot_password/screens/new_pass_screen.dart';
import 'package:greeve/view/forgot_password/screens/otp_screen.dart';
import 'package:greeve/view/login/screens/login_screen.dart';
import 'package:greeve/view/register/register_success_screen.dart';
import 'package:greeve/view/register/screens/register_screen.dart';
import 'package:greeve/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Greeve',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorsConstant.primary500),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: RoutesConstant.splashApp,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: RoutesConstant.forgotPassword,
          page: () => const ForgotPassScreen(),
        ),
        GetPage(
          name: RoutesConstant.login,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: RoutesConstant.otp,
          page: () => const OtpScreen(),
        ),
        GetPage(
          name: RoutesConstant.confirmPassword,
          page: () => const ConfirmPassScreen(),
        ),
        GetPage(
          name: RoutesConstant.register,
          page: () => const RegisterScreen(),
        ),
        GetPage(
          name: RoutesConstant.registerSuccess,
          page: () => const RegisterSuccessScreen(),
        ),
        GetPage(
          name: RoutesConstant.newPassword,
          page: () => const NewPasswordScreen(),
        ),
      ],
    );
  }
}

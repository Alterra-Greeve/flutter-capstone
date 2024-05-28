import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:greeve/view/splash_screen.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/routes_constant.dart';
import 'package:greeve/view/auth_flow/screens/login/login_screen.dart';
import 'package:greeve/view/auth_flow/screens/forgot_password/otp_screen.dart';
import 'package:greeve/view/view_product/screens/search_product/search_screen.dart';
import 'package:greeve/view/auth_flow/screens/forgot_password/confirmation_screen.dart';
import 'package:greeve/view/auth_flow/screens/forgot_password/forgot_password_screen.dart';

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
          page: () => const SearchScreen(),
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
          name: RoutesConstant.searchProduct,
          page: () => const SearchScreen(),
        ),
      ],
    );
  }
}

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:greeve/view/splash_screen.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
<<<<<<< HEAD
import 'package:greeve/utils/constants/routes_constant.dart';
import 'package:greeve/view/auth_flow/screens/login/login_screen.dart';
import 'package:greeve/view/auth_flow/screens/forgot_password/otp_screen.dart';
import 'package:greeve/view/view_product/screens/search_product/search_screen.dart';
import 'package:greeve/view/auth_flow/screens/forgot_password/confirmation_screen.dart';
import 'package:greeve/view/auth_flow/screens/forgot_password/forgot_password_screen.dart';
=======
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/view/forgot_password/screens/confirmation_screen.dart';
import 'package:greeve/view/forgot_password/screens/forgot_password_screen.dart';
import 'package:greeve/view/forgot_password/screens/new_pass_screen.dart';
import 'package:greeve/view/forgot_password/screens/otp_screen.dart';
import 'package:greeve/view/login/screens/loading_screen.dart';
import 'package:greeve/view/login/screens/login_screen.dart';
import 'package:greeve/view/register/register_success_screen.dart';
import 'package:greeve/view/register/screens/register_screen.dart';
import 'package:greeve/view/splash_screen.dart';
>>>>>>> 8091286543e1105ca84caed4d1eadeab82d60d70

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
      initialRoute: AppRoutes.splashApp,
      getPages: [
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
<<<<<<< HEAD
          name: RoutesConstant.searchProduct,
          page: () => const SearchScreen(),
=======
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
>>>>>>> 8091286543e1105ca84caed4d1eadeab82d60d70
        ),
      ],
    );
  }
}

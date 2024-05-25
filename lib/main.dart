import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/routes_constant.dart';
import 'package:greeve/view/auth_flow/screens/login_screen.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
            name: RoutesConstant.splashApp, page: () => const LoginScreen()),
      ],
    );
  }
}

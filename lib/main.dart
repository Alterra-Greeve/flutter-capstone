import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:greeve/routes/app_pages.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/helpers/api_key_helper.dart';

void main() async {
  // await dotenv.load(fileName: '.env');
  // Gemini.init(apiKey: geminiKey);
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
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(seedColor: ColorsConstant.primary500),
        scaffoldBackgroundColor: ColorsConstant.white,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: ColorsConstant.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorsConstant.white,
        ),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splashApp,
      getPages: AppPages.routes,
    );
  }
}

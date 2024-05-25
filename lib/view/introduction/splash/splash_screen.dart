import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/view/introduction/screen/on_boarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      duration: Duration(milliseconds: 3000),
      backgroundColor: ColorsConstant.white,
      childWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [SizedBox(child: Image.asset(ImagesConstant.logoSplash))],
      ),
      nextScreen: OnBoardingScreen(),
    );
  }
}

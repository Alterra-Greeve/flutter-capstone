import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/view/auth_flow/introduction/on_boarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
      duration: Duration(milliseconds: 10000),
      backgroundColor: ColorPlants.greenDark,
      childWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: ImagesConstant.logoSplash
          )
      
        ],
      ),
      nextScreen: OnBoardingScreen(),
    );
  }
}
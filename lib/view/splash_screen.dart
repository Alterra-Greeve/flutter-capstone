import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/view/on_boarding/screens/on_boarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      duration: const Duration(milliseconds: 3000),
      backgroundColor: ColorsConstant.white,
      childWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: SvgPicture.asset(ImagesConstant.logoLandscape),
          ),
        ],
      ),
      nextScreen: const OnBoardingScreen(),
    );
  }
}

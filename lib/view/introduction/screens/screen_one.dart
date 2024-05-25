import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 220,
        ),
        SvgPicture.asset(ImagesConstant.onboardingImage1),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Selamat Datang di Greeve!',
            style: TextStylesConstant.nunitoHeading3,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Temukan cara mudah untuk berkontribusi pada keberlanjutan lingkungan.',
            style: TextStylesConstant.nunitoSubtitle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

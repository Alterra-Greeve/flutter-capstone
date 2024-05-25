import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 220,
        ),
        Image.asset(ImagesConstant.screenThree),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            'Ikuti Tantangan dan Dapatkan Reward',
            style: TextStylesConstant.nunitoHeading3,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Selesaikan tantangn harian dan kumpulkan coin untuk mendapatkan diskon dan rewards',
            style: TextStylesConstant.nunitoSubtitle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

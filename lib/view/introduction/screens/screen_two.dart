import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 220,
        ),
        SvgPicture.asset(ImagesConstant.onboardingImage2),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Beli Produk Ramah Lingkungan',
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
            'Jelajahii dan beli produk yang mendukung keberlanjutan planet kita.',
            style: TextStylesConstant.nunitoSubtitle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

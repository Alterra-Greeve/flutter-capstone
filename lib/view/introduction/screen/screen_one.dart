import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 220,
        ),
        Image.asset(ImagesConstant.screenOne),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Selamat Datang di Greeve ! ',
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
            'Temukan cara mudah untuk berkontribusi pada keberlanjutan lingkungan',
            style: TextStylesConstant.nunitoSubtitle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

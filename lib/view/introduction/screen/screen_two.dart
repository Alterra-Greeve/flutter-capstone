import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 220,
        ),
        Image.asset(ImagesConstant.screenTwo),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Know a lot about caring for your plants',
            style: TextStylesConstant.nunitoHeading4,
          ),
        ),
      ],
    );
  }
}

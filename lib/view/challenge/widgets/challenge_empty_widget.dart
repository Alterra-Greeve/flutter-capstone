import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ChallengeEmptyWidget extends StatelessWidget {
  const ChallengeEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 120,
        ),
        SvgPicture.asset(
          ImagesConstant.emptyStateNoData,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Tidak ada tantangan tersisa',
          style: TextStylesConstant.nunitoButtonBold,
        ),
      ],
    );
  }
}

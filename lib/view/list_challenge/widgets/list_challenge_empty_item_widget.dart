import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ListChallengeEmptyItemWidget extends StatelessWidget {
  final String titleText;
  final String? descriptionText;
  const ListChallengeEmptyItemWidget({
    super.key,
    required this.titleText,
    this.descriptionText,
  });

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
          titleText,
          style: TextStylesConstant.nunitoButtonBold,
        ),
        Text(
          descriptionText ?? '',
          style: TextStylesConstant.nunitoCaption,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

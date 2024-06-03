import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ListChallengeLevelItemWidget extends StatelessWidget {
  final String levelChallenge;
  final Color backgroundColor;
  final Color textColor;

  const ListChallengeLevelItemWidget({
    super.key,
    required this.levelChallenge,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: Text(
        levelChallenge,
        style: TextStylesConstant.nunitoCaptionBold.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}

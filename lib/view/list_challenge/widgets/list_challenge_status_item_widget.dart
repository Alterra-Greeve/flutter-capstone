import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ListChallengeStatusItemWidget extends StatelessWidget {
  final String statusChallenge;
  final Color backgroundColor;
  final Color textColor;

  const ListChallengeStatusItemWidget({
    super.key,
    required this.statusChallenge,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: Text(
        statusChallenge,
        textAlign: TextAlign.center,
        style: TextStylesConstant.nunitoCaptionBold.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}

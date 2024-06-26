import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/detail_challenge_controller.dart';

class DetailChallengeTimeWidget extends StatelessWidget {
  final DetailChallengeController controller;
  const DetailChallengeTimeWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 42,
        right: 16,
        child: Container(
          width: 74,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: ColorsConstant.neutral100,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              '10:06:30',
              style: TextStylesConstant.nunitoCaptionBold.copyWith(
                color: ColorsConstant.neutral500,
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ListChallengeExpItemWidget extends StatelessWidget {
  final String expChallenge;

  const ListChallengeExpItemWidget({
    super.key,
    required this.expChallenge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: ColorsConstant.neutral100,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            IconsConstant.poinXp,
          ),
          const SizedBox(
            width: 6.35,
          ),
          Text(
            '+$expChallenge',
            style: TextStylesConstant.nunitoCaptionBold.copyWith(
              color: ColorsConstant.danger400,
            ),
          )
        ],
      ),
    );
  }
}

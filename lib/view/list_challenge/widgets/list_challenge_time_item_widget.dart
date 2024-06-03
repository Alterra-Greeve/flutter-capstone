import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ListChallengeTimeItemWidget extends StatelessWidget {
  final String timeChallenge;

  const ListChallengeTimeItemWidget({
    super.key,
    required this.timeChallenge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.5,
        vertical: 8,
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
            timeChallenge,
            style: TextStylesConstant.nunitoCaptionBold.copyWith(
              color: ColorsConstant.neutral500,
            ),
          )
        ],
      ),
    );
  }
}

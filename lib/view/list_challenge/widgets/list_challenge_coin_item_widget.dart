import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ListChallengeCoinItemWidget extends StatelessWidget {
  final String coinChallenge;

  const ListChallengeCoinItemWidget({
    super.key,
    required this.coinChallenge,
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
            IconsConstant.coin,
          ),
          const SizedBox(
            width: 6.35,
          ),
          Text(
            '+$coinChallenge',
            style: TextStylesConstant.nunitoCaptionBold.copyWith(
              color: ColorsConstant.warning500,
            ),
          )
        ],
      ),
    );
  }
}

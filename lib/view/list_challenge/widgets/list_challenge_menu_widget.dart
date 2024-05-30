import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ListChallengeMenuWidget extends StatelessWidget {
  const ListChallengeMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Tantangan',
            style: TextStylesConstant.nunitoHeading4,
          ),
          Row(
            children: [
              IconButton(
                icon: SvgPicture.asset(IconsConstant.leaderboard),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              IconButton(
                icon: SvgPicture.asset(IconsConstant.challengeActive),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

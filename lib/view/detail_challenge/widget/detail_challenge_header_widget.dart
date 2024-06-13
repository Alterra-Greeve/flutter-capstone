import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/images_constant.dart';

class DetailChallengeHeaderWidget extends StatelessWidget {
  const DetailChallengeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: SvgPicture.asset(
        ImagesConstant.bannerChallenge,
        fit: BoxFit.cover,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class DetailChallengePointCardWidget extends StatelessWidget {
  const DetailChallengePointCardWidget({
    super.key,
    required this.image,
    required this.points,
    required this.color,
  });

  final String image;
  final String? points;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 60,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
        color: ColorsConstant.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (image.endsWith('.svg'))
            SvgPicture.asset(
              image,
              width: 40,
            )
          else
            Image.asset(
              image,
              width: 40,
            ),
          const SizedBox(height: 4),
          Text(
            '+${points ?? ''}',
            style: TextStylesConstant.nunitoExtraBoldTitle
                .copyWith(color: color, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}

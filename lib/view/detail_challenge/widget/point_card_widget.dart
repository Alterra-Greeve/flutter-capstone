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
  final String points;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 60,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
        color: ColorsConstant.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            image,
            width: 40,
          ),
          SizedBox(height: 4),
          Text('+$points',
              style: TextStylesConstant.nunitoExtraBoldTitle
                  .copyWith(color: color)),
        ],
      ),
    );
  }
}
